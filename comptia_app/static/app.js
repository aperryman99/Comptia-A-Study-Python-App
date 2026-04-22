const studyPack = window.__STUDY_PACK__ || {};
const storageKeys = {
    quizHistory: "comptia.quizHistory",
    flashcardRatings: "comptia.flashcardRatings",
    examDate: "comptia.examDate",
    questionHistory: "comptia.questionHistory",
};

function readStorage(key, fallback) {
    try {
        const raw = window.localStorage.getItem(key);
        return raw ? JSON.parse(raw) : fallback;
    } catch (error) {
        return fallback;
    }
}

function writeStorage(key, value) {
    window.localStorage.setItem(key, JSON.stringify(value));
}

function initExamDate() {
    const input = document.getElementById("exam-date");
    const output = document.getElementById("days-remaining");
    if (!input || !output) {
        return;
    }

    const saved = readStorage(storageKeys.examDate, "");
    if (saved) {
        input.value = saved;
    }

    const updateCountdown = () => {
        const value = input.value;
        writeStorage(storageKeys.examDate, value);

        if (!value) {
            output.textContent = "Set your exam date";
            return;
        }

        const examDate = new Date(`${value}T00:00:00`);
        const today = new Date();
        today.setHours(0, 0, 0, 0);
        const diff = Math.ceil((examDate - today) / (1000 * 60 * 60 * 24));

        if (diff > 1) {
            output.textContent = `${diff} days left`;
        } else if (diff === 1) {
            output.textContent = "1 day left";
        } else if (diff === 0) {
            output.textContent = "Exam day";
        } else {
            output.textContent = `${Math.abs(diff)} days past target`;
        }
    };

    input.addEventListener("change", updateCountdown);
    updateCountdown();
}

function renderDashboardSummary() {
    const container = document.getElementById("dashboard-summary");
    if (!container) {
        return;
    }

    const quizHistory = readStorage(storageKeys.quizHistory, []);
    const latestScore = quizHistory.length ? quizHistory[quizHistory.length - 1].score : "--";
    const flashcardRatings = readStorage(storageKeys.flashcardRatings, {});
    const lockedIn = Object.values(flashcardRatings).filter((value) => value === "nailed").length;

    const cards = [
        { label: "Domains", value: studyPack.domains?.length || 0 },
        { label: "Flashcards", value: studyPack.flashcards?.length || 0 },
        { label: "Latest quiz", value: latestScore === "--" ? latestScore : `${latestScore}%` },
        { label: "Locked cards", value: lockedIn },
    ];

    container.innerHTML = cards
        .map(
            (card) => `
                <div class="metric-card">
                    <strong>${card.value}</strong>
                    <span>${card.label}</span>
                </div>
            `
        )
        .join("");
}

function initPracticePage() {
    const startQuizBtn = document.getElementById("start-quiz");
    if (!startQuizBtn) {
        return;
    }

    const elements = {
        questionCount: document.getElementById("question-count"),
        domainSelector: document.getElementById("domain-selector"),
        quizPanel: document.getElementById("quiz-panel"),
        resultsPanel: document.getElementById("results-panel"),
        progress: document.getElementById("quiz-progress"),
        domainPill: document.getElementById("quiz-domain-pill"),
        question: document.getElementById("quiz-question"),
        options: document.getElementById("quiz-options"),
        feedback: document.getElementById("quiz-feedback"),
        next: document.getElementById("next-question"),
        score: document.getElementById("results-score"),
        summary: document.getElementById("results-summary"),
        weakDomains: document.getElementById("weak-domains"),
    };

    const state = {
        questions: [],
        currentIndex: 0,
        answers: {},
        selected: null,
        locked: false,
    };

    const questionHistory = () => readStorage(storageKeys.questionHistory, {});
    const currentSession = () => readStorage(storageKeys.quizHistory, []).length + 1;
    const normalizedQuestionCount = () => {
        const minimum = Number(elements.questionCount.min || 5);
        const maximum = Number(elements.questionCount.max || 600);
        const parsed = Number(elements.questionCount.value);
        const safeValue = Number.isFinite(parsed) ? Math.trunc(parsed) : minimum;
        const clamped = Math.max(minimum, Math.min(safeValue, maximum));
        elements.questionCount.value = clamped;
        return clamped;
    };

    const selectedDomains = () =>
        Array.from(elements.domainSelector.querySelectorAll("input:checked")).map((input) => input.value);

    const renderQuestion = () => {
        const current = state.questions[state.currentIndex];
        if (!current) {
            return;
        }

        elements.quizPanel.classList.remove("hidden");
        elements.resultsPanel.classList.add("hidden");
        elements.progress.textContent = `Question ${state.currentIndex + 1} of ${state.questions.length}`;
        elements.domainPill.textContent = current.domain;
        elements.question.textContent = current.question;
        elements.feedback.classList.add("hidden");
        elements.feedback.textContent = "";
        elements.next.disabled = true;
        state.selected = state.answers[current.id] || null;
        state.locked = false;

        elements.options.innerHTML = current.options
            .map(
                (option) => `
                    <button class="option-btn ${state.selected === option ? "selected" : ""}" data-option="${option}">
                        ${option}
                    </button>
                `
            )
            .join("");

        elements.options.querySelectorAll(".option-btn").forEach((button) => {
            button.addEventListener("click", () => {
                if (state.locked) {
                    return;
                }

                const choice = button.dataset.option;
                state.selected = choice;
                state.answers[current.id] = choice;
                state.locked = true;

                elements.options.querySelectorAll(".option-btn").forEach((optionBtn) => {
                    optionBtn.classList.remove("selected");
                    if (optionBtn.dataset.option === current.answer) {
                        optionBtn.classList.add("correct");
                    } else if (optionBtn.dataset.option === choice) {
                        optionBtn.classList.add("incorrect");
                    }
                });

                elements.feedback.innerHTML = `<strong>${choice === current.answer ? "Correct." : "Not quite."}</strong> ${current.explanation}`;
                elements.feedback.classList.remove("hidden");
                elements.next.disabled = false;
            });
        });
    };

    const renderResults = async () => {
        const response = await fetch("/api/quiz/submit", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({ answers: state.answers }),
        });
        const result = await response.json();

        elements.quizPanel.classList.add("hidden");
        elements.resultsPanel.classList.remove("hidden");
        elements.score.textContent = `You scored ${result.score}%`;

        elements.summary.innerHTML = `
            <div class="metric-card"><strong>${result.correct}</strong><span>Correct answers</span></div>
            <div class="metric-card"><strong>${result.total}</strong><span>Total answered</span></div>
            <div class="metric-card"><strong>${result.score}%</strong><span>Accuracy</span></div>
        `;

        if (result.weak_domains.length) {
            elements.weakDomains.innerHTML = result.weak_domains
                .map(
                    (domain) => `
                        <div class="stack-item">
                            <strong>${domain.domain}</strong><br>
                            ${domain.correct}/${domain.total} correct (${domain.accuracy}%)
                        </div>
                    `
                )
                .join("");
        } else {
            elements.weakDomains.innerHTML = `<div class="stack-item">No weak-domain data yet. Finish a full quiz block first.</div>`;
        }

        const history = readStorage(storageKeys.quizHistory, []);
        history.push({
            score: result.score,
            correct: result.correct,
            total: result.total,
            timestamp: new Date().toISOString(),
            weakDomains: result.weak_domains,
        });
        writeStorage(storageKeys.quizHistory, history.slice(-20));

        const seenQuestions = questionHistory();
        state.questions.forEach((question) => {
            seenQuestions[String(question.id)] = history.length;
        });
        writeStorage(storageKeys.questionHistory, seenQuestions);
        renderDashboardSummary();
    };

    startQuizBtn.addEventListener("click", async () => {
        const domains = selectedDomains();
        const response = await fetch("/api/quiz", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                count: normalizedQuestionCount(),
                domains,
                recent_history: questionHistory(),
                current_session: currentSession(),
            }),
        });
        const questions = await response.json();

        state.questions = questions;
        state.currentIndex = 0;
        state.answers = {};

        renderQuestion();
    });

    elements.next.addEventListener("click", async () => {
        state.currentIndex += 1;
        if (state.currentIndex >= state.questions.length) {
            await renderResults();
            return;
        }
        renderQuestion();
    });

    elements.questionCount.addEventListener("change", normalizedQuestionCount);
}

function initFlashcardsPage() {
    const flashcard = document.getElementById("flashcard");
    if (!flashcard) {
        return;
    }

    const elements = {
        domainFilter: document.getElementById("flashcard-domain"),
        domainLabel: document.getElementById("flashcard-domain-label"),
        front: document.getElementById("flashcard-front"),
        back: document.getElementById("flashcard-back"),
        prev: document.getElementById("prev-card"),
        next: document.getElementById("next-card"),
        flip: document.getElementById("flip-card"),
        stats: document.getElementById("flashcard-stats"),
    };

    const state = {
        cards: studyPack.flashcards || [],
        filtered: [],
        index: 0,
        flipped: false,
        ratings: readStorage(storageKeys.flashcardRatings, {}),
    };

    const refreshStats = () => {
        const values = Object.values(state.ratings);
        const again = values.filter((value) => value === "again").length;
        const almost = values.filter((value) => value === "almost").length;
        const nailed = values.filter((value) => value === "nailed").length;

        elements.stats.innerHTML = `
            <div class="metric-card"><strong>${state.filtered.length}</strong><span>Cards in view</span></div>
            <div class="metric-card"><strong>${again}</strong><span>Needs work</span></div>
            <div class="metric-card"><strong>${almost}</strong><span>Almost there</span></div>
            <div class="metric-card"><strong>${nailed}</strong><span>Locked in</span></div>
        `;
    };

    const applyFilter = () => {
        const domain = elements.domainFilter.value;
        state.filtered = domain === "All"
            ? state.cards
            : state.cards.filter((card) => card.domain === domain);
        state.index = 0;
        state.flipped = false;
        renderCard();
        refreshStats();
    };

    const renderCard = () => {
        const card = state.filtered[state.index];
        if (!card) {
            elements.domainLabel.textContent = "No cards";
            elements.front.textContent = "No flashcards match this filter yet.";
            elements.back.textContent = "";
            return;
        }

        elements.domainLabel.textContent = `${card.domain} • Card ${state.index + 1} of ${state.filtered.length}`;
        elements.front.textContent = card.front;
        elements.back.textContent = card.back;
        elements.back.classList.toggle("hidden", !state.flipped);
    };

    elements.domainFilter.addEventListener("change", applyFilter);
    elements.flip.addEventListener("click", () => {
        state.flipped = !state.flipped;
        renderCard();
    });
    elements.prev.addEventListener("click", () => {
        state.index = (state.index - 1 + state.filtered.length) % state.filtered.length;
        state.flipped = false;
        renderCard();
    });
    elements.next.addEventListener("click", () => {
        state.index = (state.index + 1) % state.filtered.length;
        state.flipped = false;
        renderCard();
    });

    document.querySelectorAll(".confidence-btn").forEach((button) => {
        button.addEventListener("click", () => {
            const card = state.filtered[state.index];
            if (!card) {
                return;
            }
            state.ratings[`${card.domain}:${card.front}`] = button.dataset.confidence;
            writeStorage(storageKeys.flashcardRatings, state.ratings);
            refreshStats();
        });
    });

    applyFilter();
}

function initPage() {
    initExamDate();
    renderDashboardSummary();
    initPracticePage();
    initFlashcardsPage();
}

window.addEventListener("DOMContentLoaded", initPage);
