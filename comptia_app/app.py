from __future__ import annotations

import json
import random
from pathlib import Path

from flask import Flask, jsonify, render_template, request

BASE_DIR = Path(__file__).resolve().parent
DATA_DIR = BASE_DIR / "data"

app = Flask(__name__)


def load_json(filename: str) -> dict | list:
    with (DATA_DIR / filename).open(encoding="utf-8") as file:
        return json.load(file)


study_pack = load_json("study_pack.json")
question_bank = load_json("questions.json")

DIFFICULTY_COOLDOWN = {
    "easy": 5,
    "medium": 3,
    "hard": 2,
}


def is_on_cooldown(question: dict, recent_history: dict[str, int], current_session: int) -> bool:
    last_seen = recent_history.get(str(question["id"]))
    if last_seen is None:
        return False

    cooldown = DIFFICULTY_COOLDOWN.get(question["difficulty"], 3)
    return current_session - last_seen < cooldown


def interleave_by_domain(questions: list[dict]) -> list[dict]:
    buckets: dict[str, list[dict]] = {}
    for question in questions:
        buckets.setdefault(question["domain"], []).append(question)

    for bucket in buckets.values():
        random.shuffle(bucket)

    ordered_domains = list(buckets.keys())
    random.shuffle(ordered_domains)

    mixed: list[dict] = []
    while ordered_domains:
        remaining_domains: list[str] = []
        for domain in ordered_domains:
            bucket = buckets[domain]
            if bucket:
                mixed.append(bucket.pop())
            if bucket:
                remaining_domains.append(domain)
        ordered_domains = remaining_domains

    return mixed


def filtered_questions(
    domains: list[str] | None,
    count: int,
    recent_history: dict[str, int] | None,
    current_session: int,
) -> list[dict]:
    selected = [
        question
        for question in question_bank
        if not domains or question["domain"] in domains
    ]

    if not selected:
        return []

    recent_history = recent_history or {}
    fresh_questions = [
        question
        for question in selected
        if not is_on_cooldown(question, recent_history, current_session)
    ]
    cooled_down_questions = [
        question for question in selected if question not in fresh_questions
    ]

    fresh_mixed = interleave_by_domain(fresh_questions)
    if len(fresh_mixed) >= count:
        return fresh_mixed[:count]

    fallback_mixed = interleave_by_domain(cooled_down_questions)
    return (fresh_mixed + fallback_mixed)[:count]


@app.route("/")
def dashboard():
    return render_template("index.html", study_pack=study_pack)


@app.route("/practice")
def practice():
    return render_template("practice.html", study_pack=study_pack)


@app.route("/flashcards")
def flashcards():
    return render_template("flashcards.html", study_pack=study_pack)


@app.route("/cram")
def cram():
    return render_template("cram.html", study_pack=study_pack)


@app.route("/api/study-pack")
def get_study_pack():
    return jsonify(study_pack)


@app.route("/api/quiz", methods=["POST"])
def get_quiz():
    payload = request.get_json(silent=True) or {}
    requested_domains = payload.get("domains", [])
    count = max(5, min(int(payload.get("count", 10)), 60))
    recent_history = payload.get("recent_history", {})
    current_session = int(payload.get("current_session", 0))

    quiz_questions = filtered_questions(
        requested_domains or None,
        count,
        recent_history,
        current_session,
    )
    return jsonify(quiz_questions)


@app.route("/api/quiz/submit", methods=["POST"])
def submit_quiz():
    payload = request.get_json(silent=True) or {}
    answers = payload.get("answers", {})
    domains: dict[str, dict[str, int]] = {}
    correct = 0

    for question in question_bank:
        question_id = str(question["id"])
        if question_id not in answers:
            continue

        domain_stats = domains.setdefault(
            question["domain"], {"correct": 0, "total": 0}
        )
        domain_stats["total"] += 1

        if answers[question_id] == question["answer"]:
            correct += 1
            domain_stats["correct"] += 1

    total = len(answers)
    score = round((correct / total) * 100) if total else 0

    weak_domains = sorted(
        (
            {
                "domain": domain,
                "accuracy": round((stats["correct"] / stats["total"]) * 100),
                "correct": stats["correct"],
                "total": stats["total"],
            }
            for domain, stats in domains.items()
        ),
        key=lambda item: item["accuracy"],
    )

    return jsonify(
        {
            "score": score,
            "correct": correct,
            "total": total,
            "weak_domains": weak_domains[:3],
        }
    )


if __name__ == "__main__":
    app.run(debug=True)
