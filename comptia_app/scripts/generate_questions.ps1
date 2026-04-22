$seeds = New-Object System.Collections.Generic.List[object]

function Add-Seed {
    param(
        [string]$Domain,
        [string]$Difficulty,
        [string]$Question,
        [string[]]$Options,
        [string]$Answer,
        [string]$Explanation
    )

    $seeds.Add([pscustomobject]@{
        domain = $Domain
        difficulty = $Difficulty
        question = $Question
        options = $Options
        answer = $Answer
        explanation = $Explanation
    })
}

Add-Seed "Hardware" "easy" "Which cable connector is used internally for most modern SATA drives?" @("SATA data", "RJ45", "Molex mini-fit", "DisplayPort") "SATA data" "SATA drives use a thin internal SATA data cable to connect to the motherboard."
Add-Seed "Hardware" "easy" "Which component converts AC wall power into DC voltages for the computer?" @("PSU", "CPU", "CMOS battery", "Northbridge") "PSU" "The power supply unit converts incoming AC power into regulated DC power for system components."
Add-Seed "Hardware" "easy" "What type of storage media uses spinning magnetic platters?" @("HDD", "SSD", "NVMe module", "SDRAM") "HDD" "Hard disk drives store data on spinning magnetic platters."
Add-Seed "Hardware" "easy" "Which port is commonly used for a wired network connection on a desktop PC?" @("RJ45", "HDMI", "DB9", "PS/2") "RJ45" "Ethernet network cables terminate in an RJ45 connector."
Add-Seed "Hardware" "easy" "What component is normally installed in a DIMM slot?" @("RAM", "CPU", "NVMe SSD", "GPU") "RAM" "Desktop memory modules are installed in DIMM slots on the motherboard."
Add-Seed "Hardware" "medium" "Which expansion slot is standard for modern dedicated graphics cards?" @("PCIe x16", "Mini-PCI", "PCI", "ISA") "PCIe x16" "Modern graphics cards are designed for PCI Express x16 slots."
Add-Seed "Hardware" "medium" "Which printer technology uses toner and a fuser assembly?" @("Laser printer", "Inkjet printer", "Thermal printer", "Impact printer") "Laser printer" "Laser printers use toner powder and a heated fuser to bond the image to paper."
Add-Seed "Hardware" "medium" "What is the purpose of a heat sink and fan on a processor?" @("Dissipate heat", "Provide backup power", "Store firmware", "Route network traffic") "Dissipate heat" "Cooling hardware removes heat from the CPU so it can operate safely."
Add-Seed "Hardware" "medium" "Which display standard commonly carries both digital video and audio over one cable?" @("HDMI", "VGA", "RJ11", "PS/2") "HDMI" "HDMI is a common interface for digital video and audio."
Add-Seed "Hardware" "medium" "Which storage form factor often plugs directly into the motherboard and can use NVMe?" @("M.2", "3.5-inch bay", "LTO", "eSATA enclosure") "M.2" "M.2 modules can connect directly to the motherboard and often use NVMe."
Add-Seed "Hardware" "medium" "Which RAID level mirrors data across two drives for redundancy?" @("RAID 1", "RAID 0", "RAID 5", "RAID 10 striping only") "RAID 1" "RAID 1 writes identical data to both disks to improve fault tolerance."
Add-Seed "Hardware" "medium" "Which laptop display issue is commonly caused by a failed inverter in older systems?" @("Dim backlight", "Dead Wi-Fi", "No touch response", "Trackpad drift") "Dim backlight" "Older CCFL-based laptop screens may appear dim when the inverter fails."
Add-Seed "Hardware" "hard" "Which memory feature helps detect and correct certain data corruption in RAM?" @("ECC", "XMP", "PnP", "POST") "ECC" "Error-correcting code memory can detect and correct certain memory errors."
Add-Seed "Hardware" "hard" "What does POST stand for during system startup?" @("Power-On Self-Test", "Primary Output System Tool", "Peripheral Operating System Transfer", "Power Option Setup Table") "Power-On Self-Test" "POST is the firmware's startup diagnostic process."
Add-Seed "Hardware" "hard" "Which connector provides external high-speed storage using the SATA protocol?" @("eSATA", "RJ45", "DVI-D", "Molex") "eSATA" "eSATA extends the SATA interface for certain external storage connections."
Add-Seed "Hardware" "hard" "A system board needs a setting retained when the PC is unplugged. Which component supports that?" @("CMOS battery", "CPU fan", "Heatsink compound", "POST card") "CMOS battery" "The CMOS battery maintains real-time clock and firmware settings when power is removed."
Add-Seed "Hardware" "hard" "Which type of connector is associated with analog video and commonly has 15 pins?" @("VGA", "HDMI", "USB-C", "Lightning") "VGA" "VGA is an older analog video interface often identified by its 15-pin connector."

Add-Seed "Networking" "easy" "Which protocol automatically assigns IP settings to clients on most networks?" @("DHCP", "DNS", "SNMP", "LDAP") "DHCP" "DHCP leases IP addresses and related network settings to clients."
Add-Seed "Networking" "easy" "What port does HTTPS use by default?" @("443", "53", "25", "3389") "443" "HTTPS normally uses TCP port 443."
Add-Seed "Networking" "easy" "Which DNS record type maps a hostname to an IPv4 address?" @("A", "MX", "AAAA", "TXT") "A" "An A record maps a hostname to an IPv4 address."
Add-Seed "Networking" "easy" "Which device forwards packets between different networks?" @("Router", "Patch panel", "Printer", "Loopback plug") "Router" "Routers connect networks and forward traffic between them."
Add-Seed "Networking" "easy" "What command quickly checks whether a remote host is reachable?" @("ping", "format", "diskpart", "gpupdate") "ping" "Ping sends ICMP echo requests to test connectivity."
Add-Seed "Networking" "medium" "Which command displays local IP configuration details on Windows?" @("ipconfig", "dir", "sfc", "copy") "ipconfig" "ipconfig shows adapter settings such as IP address, subnet mask, and gateway."
Add-Seed "Networking" "medium" "Which command shows the path packets take to a destination on Windows?" @("tracert", "hostname", "taskkill", "defrag") "tracert" "tracert lists the network hops between the source and destination."
Add-Seed "Networking" "medium" "Which wireless encryption choice is the strongest modern option for a home network when available?" @("WPA3", "WEP", "WPA", "Open") "WPA3" "WPA3 is the preferred current wireless security option when supported."
Add-Seed "Networking" "medium" "What is the function of DNS on a network?" @("Translate names to IP addresses", "Assign IP addresses", "Encrypt all traffic", "Mirror hard drives") "Translate names to IP addresses" "DNS resolves names like example.com to IP addresses."
Add-Seed "Networking" "medium" "Which cable type uses twisted copper pairs and an RJ45 connector?" @("Ethernet twisted pair", "Coaxial RG6", "Fiber SC", "Serial rollover") "Ethernet twisted pair" "Standard Ethernet cabling uses twisted pairs and an RJ45 connector."
Add-Seed "Networking" "medium" "Which Wi-Fi standard is associated with Wi-Fi 6 and, with 6E, the 6 GHz band?" @("802.11ax", "802.11g", "802.11ac", "802.11b") "802.11ax" "802.11ax is Wi-Fi 6 and expands into 6 GHz with Wi-Fi 6E."
Add-Seed "Networking" "medium" "Which port is used by SSH for secure remote terminal access?" @("22", "21", "23", "161") "22" "SSH typically uses TCP port 22."
Add-Seed "Networking" "hard" "Which command is most directly used to query DNS records from a client machine?" @("nslookup", "mstsc", "diskpart", "gpupdate") "nslookup" "nslookup queries DNS servers for name resolution information."
Add-Seed "Networking" "hard" "Which tool is used to locate a break in a copper network cable run?" @("TDR", "ESD strap", "Loopback plug", "Multimeter set to ohms only") "TDR" "A time-domain reflectometer can help identify cable faults and distance to the break."
Add-Seed "Networking" "hard" "Which port is associated with RDP remote desktop connections?" @("3389", "143", "67", "995") "3389" "Remote Desktop Protocol commonly uses TCP port 3389."
Add-Seed "Networking" "hard" "Which subnet mask is associated with a typical /24 IPv4 network?" @("255.255.255.0", "255.0.0.0", "255.255.0.0", "255.255.255.252") "255.255.255.0" "A /24 network corresponds to the mask 255.255.255.0."
Add-Seed "Networking" "hard" "Which protocol and port combination is correct for secure web browsing?" @("HTTPS on 443", "HTTP on 22", "DNS on 3389", "SMTP on 110") "HTTPS on 443" "Secure web browsing uses HTTPS over port 443."

Add-Seed "Mobile Devices" "easy" "Which wireless technology is commonly used for tap-to-pay phone transactions?" @("NFC", "SATA", "RJ11", "Molex") "NFC" "Near-field communication supports close-range tap-to-pay features."
Add-Seed "Mobile Devices" "easy" "Which accessory is commonly used for hands-free calls with a smartphone?" @("Bluetooth headset", "Tone generator", "Projector mount", "KVM switch") "Bluetooth headset" "Bluetooth headsets provide short-range wireless audio for calls."
Add-Seed "Mobile Devices" "easy" "What feature lets a smartphone share its internet connection with a laptop?" @("Tethering", "Overclocking", "Spooling", "Imaging") "Tethering" "Tethering shares a mobile device's data connection with another device."
Add-Seed "Mobile Devices" "easy" "Which authentication feature uses a fingertip to unlock a mobile device?" @("Fingerprint reader", "RJ45", "Docking station", "GPS receiver") "Fingerprint reader" "Fingerprint sensors are a common biometric authentication method."
Add-Seed "Mobile Devices" "easy" "A phone battery is swelling. What is the safest first action?" @("Power it down and replace it safely", "Puncture it", "Freeze it", "Charge it to 100 percent") "Power it down and replace it safely" "Swollen batteries are hazardous and should be removed from use safely."
Add-Seed "Mobile Devices" "medium" "Which mobile management capability is most helpful when a company phone is lost?" @("Remote wipe", "Auto-rotate", "Dark mode", "Airplane mode") "Remote wipe" "Remote wipe helps protect company data on a lost or stolen device."
Add-Seed "Mobile Devices" "medium" "Which laptop feature often allows output to an external monitor?" @("HDMI port", "SD card reader", "Webcam shutter", "Function lock") "HDMI port" "An HDMI port is commonly used to connect an external display."
Add-Seed "Mobile Devices" "medium" "Which screen lock method is an example of something you are?" @("Fingerprint scan", "PIN", "Password", "Security question") "Fingerprint scan" "A fingerprint is a biometric factor based on something you are."
Add-Seed "Mobile Devices" "medium" "Which synchronization approach keeps data in an online service and updates multiple devices?" @("Cloud sync", "Cold swap", "Disk striping", "Loopback testing") "Cloud sync" "Cloud synchronization keeps data consistent across devices through an online service."
Add-Seed "Mobile Devices" "medium" "What is the purpose of airplane mode on a phone?" @("Disable wireless radios", "Increase screen brightness", "Reset the operating system", "Encrypt the storage") "Disable wireless radios" "Airplane mode disables cellular and other radios to reduce interference."
Add-Seed "Mobile Devices" "medium" "Which mobile connection can be used for short-range peripheral pairing such as earbuds?" @("Bluetooth", "SATA", "PCIe", "RJ45") "Bluetooth" "Bluetooth is widely used for short-range pairing of mobile accessories."
Add-Seed "Mobile Devices" "medium" "Which connector is reversible and common on modern Android devices?" @("USB-C", "Mini-DIN", "DB25", "FireWire 400") "USB-C" "USB-C is reversible and widely used on modern phones and tablets."
Add-Seed "Mobile Devices" "hard" "A mobile user wants to connect a laptop to the phone's data plan over Wi-Fi. Which feature should be enabled?" @("Mobile hotspot", "Secure boot", "BitLocker", "Safe mode") "Mobile hotspot" "A mobile hotspot shares the phone's internet connection over Wi-Fi."
Add-Seed "Mobile Devices" "hard" "Which mobile security control helps enforce passcodes and remote wipe from a central console?" @("MDM", "POST", "RAID", "S.M.A.R.T.") "MDM" "Mobile device management enforces device settings and security policies."
Add-Seed "Mobile Devices" "hard" "Which symptom most strongly suggests a failing mobile battery rather than a display issue?" @("Rapid power drain", "Screen tint shift", "Dead pixels", "Loose hinge") "Rapid power drain" "A battery that drains unusually fast often indicates battery degradation."
Add-Seed "Mobile Devices" "hard" "Which feature uses the device location service to help recover a lost smartphone?" @("Find my device", "Print spooling", "Port mirroring", "PXE boot") "Find my device" "Location and remote management features can help track a lost phone."
Add-Seed "Mobile Devices" "hard" "Which connector type was common on older Apple mobile devices before USB-C?" @("Lightning", "RJ11", "PS/2", "eSATA") "Lightning" "Older iPhones and iPads commonly used the Lightning connector."

Add-Seed "Virtualization & Cloud" "easy" "What is a hypervisor used for?" @("Hosting virtual machines", "Cleaning printer rollers", "Terminating Ethernet cables", "Charging laptops") "Hosting virtual machines" "A hypervisor creates and runs virtual machines."
Add-Seed "Virtualization & Cloud" "easy" "Which cloud model provides virtualized compute, storage, and networking resources?" @("IaaS", "SaaS", "MFA", "RAID") "IaaS" "Infrastructure as a Service provides virtualized hardware resources."
Add-Seed "Virtualization & Cloud" "easy" "Which cloud model delivers finished applications to end users over the internet?" @("SaaS", "IaaS", "PaaS", "Type 1") "SaaS" "Software as a Service delivers complete hosted applications."
Add-Seed "Virtualization & Cloud" "easy" "Which hypervisor type runs directly on the hardware?" @("Type 1", "Type 2", "Hosted app", "Thin client") "Type 1" "Type 1 hypervisors are installed directly on bare metal hardware."
Add-Seed "Virtualization & Cloud" "easy" "What is the main purpose of a VM snapshot?" @("Capture a point-in-time state", "Increase CPU speed", "Replace MFA", "Defragment a disk") "Capture a point-in-time state" "Snapshots let you return a VM to a prior state."
Add-Seed "Virtualization & Cloud" "medium" "Which cloud characteristic allows resources to scale up or down with demand?" @("Elasticity", "Overclocking", "Defragmentation", "Sandboxing") "Elasticity" "Elasticity means cloud resources can grow or shrink as needed."
Add-Seed "Virtualization & Cloud" "medium" "Which cloud service model gives developers a managed platform to deploy code without managing the hardware?" @("PaaS", "IaaS", "SaaS", "NFC") "PaaS" "Platform as a Service provides the runtime environment for applications."
Add-Seed "Virtualization & Cloud" "medium" "Which concept means multiple customers share the same cloud infrastructure securely?" @("Multi-tenancy", "Loopback", "Mirroring", "Journaling") "Multi-tenancy" "Cloud providers isolate multiple tenants while using shared infrastructure."
Add-Seed "Virtualization & Cloud" "medium" "What does measured service mean in cloud computing?" @("Usage can be monitored and billed", "Devices are manually inventoried", "Resources never scale", "Backups are not needed") "Usage can be monitored and billed" "Measured service means resource consumption is tracked and often billed accordingly."
Add-Seed "Virtualization & Cloud" "medium" "Which benefit is commonly associated with rapid elasticity in the cloud?" @("Resources are provisioned quickly", "No authentication is required", "All systems become on-premises", "No downtime ever occurs") "Resources are provisioned quickly" "Rapid elasticity allows fast scaling when demand changes."
Add-Seed "Virtualization & Cloud" "medium" "Which virtualization technology isolates applications with a shared host OS kernel?" @("Containers", "Tape libraries", "RAID arrays", "Patch panels") "Containers" "Containers share the host kernel while isolating application environments."
Add-Seed "Virtualization & Cloud" "medium" "Which scenario best matches a private cloud?" @("Resources dedicated to one organization", "Public resources for anyone", "No internet access anywhere", "A single USB drive") "Resources dedicated to one organization" "Private clouds are dedicated to one organization."
Add-Seed "Virtualization & Cloud" "hard" "Which responsibility typically remains with the customer in most cloud models?" @("Managing account access", "Replacing provider datacenter UPS batteries", "Repairing provider routers", "Controlling public utility power") "Managing account access" "Customers are generally responsible for identity and access management."
Add-Seed "Virtualization & Cloud" "hard" "Which approach helps a virtualized environment recover quickly from a failed host?" @("Live migration or failover clustering", "Replacing the monitor cable", "Clearing browser cache", "Turning off DHCP") "Live migration or failover clustering" "High-availability virtualization features reduce downtime when hosts fail."
Add-Seed "Virtualization & Cloud" "hard" "What is the main advantage of resource pooling in cloud environments?" @("Shared resources can be allocated efficiently", "All systems use physical tapes", "Users manage their own power grid", "It removes the need for backups") "Shared resources can be allocated efficiently" "Resource pooling lets providers serve workloads efficiently from shared infrastructure."
Add-Seed "Virtualization & Cloud" "hard" "Which hypervisor type is commonly installed on top of an existing operating system?" @("Type 2", "Type 1", "Bare-metal switch", "Mobile hotspot") "Type 2" "Type 2 hypervisors run as applications on a host OS."
Add-Seed "Virtualization & Cloud" "hard" "A team needs on-demand virtual desktops delivered from centralized infrastructure. Which technology best fits?" @("VDI", "WEP", "PXE", "RAID 0") "VDI" "Virtual desktop infrastructure centrally hosts desktops for users."

Add-Seed "Troubleshooting" "easy" "What is the first step in the CompTIA troubleshooting methodology?" @("Identify the problem", "Document findings", "Verify full functionality", "Replace the motherboard") "Identify the problem" "You begin by identifying the problem before forming a theory or taking action."
Add-Seed "Troubleshooting" "easy" "After implementing a fix, what step should come next before final documentation?" @("Verify full system functionality", "Swap all cables", "Wipe the drive", "Rebuild the profile") "Verify full system functionality" "You verify the fix worked and consider preventive measures before closing the issue."
Add-Seed "Troubleshooting" "easy" "Why is documenting findings during support work important?" @("It preserves actions and outcomes", "It disables updates", "It speeds CPU clocks", "It replaces backups") "It preserves actions and outcomes" "Documentation supports repeatability, handoff quality, and historical records."
Add-Seed "Troubleshooting" "easy" "A PC shuts down unexpectedly under load. What is a common likely cause?" @("Overheating", "A bright wallpaper", "Too many fonts", "A disabled screensaver") "Overheating" "Thermal problems often show up when the system is under stress."
Add-Seed "Troubleshooting" "easy" "A user reports no network access on one PC. Which quick command checks the local TCP/IP stack on Windows?" @("ping 127.0.0.1", "format", "cipher /w", "bootrec") "ping 127.0.0.1" "Pinging the loopback address verifies the local TCP/IP stack is responding."
Add-Seed "Troubleshooting" "medium" "Which troubleshooting approach is best?" @("Test one change at a time", "Make many changes at once", "Skip user questions", "Ignore the probable cause") "Test one change at a time" "Changing one thing at a time helps isolate the actual cause."
Add-Seed "Troubleshooting" "medium" "A laser printer keeps producing streaks. Which component is a likely area to inspect?" @("Toner and drum path", "CPU socket", "Wi-Fi antenna", "CMOS battery") "Toner and drum path" "Streaking is often related to toner, drum, or fuser path issues."
Add-Seed "Troubleshooting" "medium" "A system powers on but shows no display. What simple step should be checked early?" @("Verify monitor power and cable", "Reimage the OS", "Replace the router", "Delete the user account") "Verify monitor power and cable" "Start with the simplest likely causes, such as power and cable connections."
Add-Seed "Troubleshooting" "medium" "What does establishing a theory of probable cause mean?" @("Form a likely explanation to test", "Document only the final fix", "Replace parts blindly", "Skip basic checks") "Form a likely explanation to test" "A theory of probable cause is a possible cause that you will test."
Add-Seed "Troubleshooting" "medium" "Which symptom often suggests low memory or too many running processes?" @("Slow application switching", "Paper jam", "Loose HDMI cable", "No dial tone") "Slow application switching" "Insufficient memory often makes multitasking and app switching sluggish."
Add-Seed "Troubleshooting" "medium" "Which tool is commonly used to inspect event logs during Windows troubleshooting?" @("Event Viewer", "Disk Cleanup", "Paint", "Character Map") "Event Viewer" "Event Viewer provides system, application, and security logs."
Add-Seed "Troubleshooting" "medium" "A user cannot print. Which basic check is reasonable before deeper diagnostics?" @("Confirm the correct printer is selected and online", "Reset BIOS to defaults", "Replace the SSD", "Change the subnet mask") "Confirm the correct printer is selected and online" "Simple configuration issues should be ruled out early."
Add-Seed "Troubleshooting" "hard" "What should you do if a tested theory is not confirmed?" @("Establish a new theory or escalate", "Format the drive immediately", "Ignore the results", "Document the issue as solved") "Establish a new theory or escalate" "If the first theory fails, form another theory or escalate as needed."
Add-Seed "Troubleshooting" "hard" "A BSOD appears immediately after a new driver was installed. What is the most likely cause?" @("Bad or incompatible driver", "Incorrect wallpaper resolution", "Worn keyboard key", "Low toner") "Bad or incompatible driver" "A recent driver change is a strong clue when a stop error begins immediately afterward."
Add-Seed "Troubleshooting" "hard" "Which action best reflects good professionalism during troubleshooting?" @("Communicate changes and expectations clearly", "Promise impossible timeframes", "Hide mistakes from the ticket", "Use jargon to confuse the user") "Communicate changes and expectations clearly" "Clear communication builds trust and reduces confusion during support."
Add-Seed "Troubleshooting" "hard" "Why should you question the obvious when troubleshooting?" @("A symptom may have more than one possible cause", "It avoids all documentation", "It guarantees the first fix is correct", "It removes the need for testing") "A symptom may have more than one possible cause" "Several faults can produce the same symptom, so assumptions should be tested."
Add-Seed "Troubleshooting" "hard" "When should you consider escalating a problem?" @("When the issue exceeds your authority or available resources", "Before gathering any information", "After deleting all logs", "Only after replacing hardware at random") "When the issue exceeds your authority or available resources" "Escalation is appropriate when the problem is beyond your scope or constraints."

Add-Seed "Operating Systems" "easy" "Which Windows utility is commonly used to inspect and end running processes?" @("Task Manager", "Disk Management", "Registry Editor", "Snipping Tool") "Task Manager" "Task Manager shows running processes and allows you to end tasks."
Add-Seed "Operating Systems" "easy" "Which file system is standard for modern Windows installations?" @("NTFS", "ext4", "HFS+", "FAT12") "NTFS" "NTFS supports permissions, journaling, compression, and encryption."
Add-Seed "Operating Systems" "easy" "What command checks the integrity of protected Windows system files?" @("sfc /scannow", "tracert", "nslookup", "diskcopy") "sfc /scannow" "System File Checker scans and repairs protected Windows files."
Add-Seed "Operating Systems" "easy" "Which boot option starts Windows with minimal drivers and services?" @("Safe Mode", "PXE boot", "Dual boot", "Hibernate") "Safe Mode" "Safe Mode loads a minimal set of drivers and services for diagnostics."
Add-Seed "Operating Systems" "easy" "Which Windows tool is used to manage partitions and volumes?" @("Disk Management", "Task Scheduler", "Control Panel classic theme", "Character Map") "Disk Management" "Disk Management is used to create, resize, and manage disks and partitions."
Add-Seed "Operating Systems" "medium" "Which command displays network configuration details on Windows?" @("ipconfig", "mkdir", "echo", "copy con") "ipconfig" "ipconfig shows IP settings for local interfaces."
Add-Seed "Operating Systems" "medium" "Which Linux command changes file permissions?" @("chmod", "grep", "pwd", "nano") "chmod" "chmod modifies read, write, and execute permissions on Linux files."
Add-Seed "Operating Systems" "medium" "Which Windows command is used to repair logical file system errors on a disk?" @("chkdsk", "dir", "help", "gpresult") "chkdsk" "chkdsk checks disks for file system problems and can repair errors."
Add-Seed "Operating Systems" "medium" "Which Windows utility helps view system and application logs?" @("Event Viewer", "Notepad", "Paint", "Calc") "Event Viewer" "Event Viewer is used to inspect logs during troubleshooting."
Add-Seed "Operating Systems" "medium" "Which command-line tool can list active network connections on Windows?" @("netstat", "defrag", "cleanmgr", "robocopy") "netstat" "netstat displays active connections, listening ports, and related statistics."
Add-Seed "Operating Systems" "medium" "Which Windows feature encrypts an entire system drive?" @("BitLocker", "System Restore", "Defender Firewall", "Sticky Keys") "BitLocker" "BitLocker provides full-disk encryption on supported Windows editions."
Add-Seed "Operating Systems" "medium" "What does GUI stand for?" @("Graphical User Interface", "Global User Index", "Guided Utility Instruction", "Grouped Unified Internet") "Graphical User Interface" "A GUI allows users to interact visually using windows, icons, and menus."
Add-Seed "Operating Systems" "hard" "Which file system is most associated with Linux distributions?" @("ext4", "NTFS", "ReFS only", "APFS only") "ext4" "ext4 is a common Linux file system."
Add-Seed "Operating Systems" "hard" "Which command can rebuild the Windows boot configuration in recovery scenarios?" @("bootrec /rebuildbcd", "hostname", "net use", "route add") "bootrec /rebuildbcd" "bootrec /rebuildbcd is used in Windows recovery to rebuild boot configuration data."
Add-Seed "Operating Systems" "hard" "Which macOS feature is used to make system backups to external storage?" @("Time Machine", "BitLocker", "Diskpart", "Tasklist") "Time Machine" "Time Machine is Apple's built-in backup utility."
Add-Seed "Operating Systems" "hard" "Which Windows utility lets you manage services and startup types?" @("services.msc", "dxdiag", "osk", "write") "services.msc" "The Services console is used to manage installed services."
Add-Seed "Operating Systems" "hard" "Which command can terminate a process by PID or image name from the Windows command line?" @("taskkill", "taskbar", "powercfg", "ver") "taskkill" "taskkill is used to end processes from the command line."

Add-Seed "Security" "easy" "Phishing is best described as what?" @("A social engineering attack", "A backup strategy", "A printer language", "A cloud model") "A social engineering attack" "Phishing tricks people into giving up credentials or sensitive information."
Add-Seed "Security" "easy" "What principle gives users only the access needed to do their job?" @("Least privilege", "Open permissions", "Full trust", "Guest access") "Least privilege" "Least privilege reduces risk by limiting access rights."
Add-Seed "Security" "easy" "Which authentication approach combines something you know with something you have?" @("MFA", "NAT", "RAID", "DNS") "MFA" "Multi-factor authentication uses multiple factor types."
Add-Seed "Security" "easy" "Which practice helps protect data if a laptop is stolen?" @("Full-disk encryption", "Defragmenting", "Increasing screen brightness", "Installing fonts") "Full-disk encryption" "Encryption helps keep the data unreadable if the device is lost."
Add-Seed "Security" "easy" "What kind of malware disguises itself as legitimate software?" @("Trojan", "Worm", "Patch", "Hypervisor") "Trojan" "A Trojan pretends to be legitimate to trick the user into running it."
Add-Seed "Security" "medium" "Which type of malware can spread on its own across networks without user action?" @("Worm", "Macro", "Patch", "Driver") "Worm" "Worms self-propagate without needing the user to install them."
Add-Seed "Security" "medium" "Which attack manipulates people using fear, urgency, or authority cues?" @("Social engineering", "Load balancing", "Drive imaging", "Print spooling") "Social engineering" "Social engineering attacks target human behavior rather than hardware."
Add-Seed "Security" "medium" "Which physical security control helps prevent tailgating into a secured area?" @("Mantrap", "Patch panel", "UPS", "Docking station") "Mantrap" "A mantrap controls entry so only one person can pass through a secured point at a time."
Add-Seed "Security" "medium" "What security feature should be enabled on a wireless router instead of WEP?" @("WPA3 or WPA2", "Open authentication", "Hidden SSID only", "MAC address sticker") "WPA3 or WPA2" "WPA3 is preferred, with WPA2 as a common secure fallback."
Add-Seed "Security" "medium" "Which policy item usually defines minimum password length and complexity?" @("Password policy", "Printer queue", "Change log", "Cable map") "Password policy" "A password policy sets organization standards for passwords."
Add-Seed "Security" "medium" "Which kind of malicious software records a user's keystrokes?" @("Keylogger", "Hypervisor", "Bridge", "Driver pack") "Keylogger" "Keyloggers capture keystrokes to steal information such as credentials."
Add-Seed "Security" "medium" "Which Windows feature helps block unsolicited inbound network traffic?" @("Firewall", "Recycle Bin", "Taskbar", "Clipboard history") "Firewall" "A firewall filters traffic according to configured rules."
Add-Seed "Security" "hard" "Which practice reduces the chance of shoulder surfing at a workstation?" @("Privacy screen", "Bigger monitor", "Extra speakers", "Open desk layout") "Privacy screen" "Privacy filters reduce the viewing angle for people nearby."
Add-Seed "Security" "hard" "Which concept refers to using one sign-in to access multiple connected systems?" @("SSO", "MFA", "AES", "RAID 5") "SSO" "Single sign-on allows one login to access multiple related services."
Add-Seed "Security" "hard" "Which encryption type is considered symmetric encryption?" @("AES", "RSA", "ECC memory", "SHA-256") "AES" "AES uses the same key for encryption and decryption."
Add-Seed "Security" "hard" "What is the main goal of an access control list?" @("Define which users or groups can access a resource", "Increase CPU speed", "Rotate backups", "Calibrate printers") "Define which users or groups can access a resource" "ACLs specify permissions on resources."
Add-Seed "Security" "hard" "Which control helps ensure a BIOS or UEFI system boots only trusted software?" @("Secure Boot", "Safe Mode", "Airplane mode", "Screen timeout") "Secure Boot" "Secure Boot helps prevent unauthorized boot code from loading."

Add-Seed "Software Troubleshooting" "easy" "A browser starts redirecting to strange sites after an extension install. What is a likely cause?" @("Malicious add-on or malware", "Faulty monitor cable", "Bad toner cartridge", "Loose RAM latch") "Malicious add-on or malware" "Unexpected redirects often point to malicious browser add-ons or malware."
Add-Seed "Software Troubleshooting" "easy" "An application crashes right after an update. What is a reasonable early step?" @("Check compatibility or roll back the update", "Replace the CPU", "Reset the router", "Delete all user data") "Check compatibility or roll back the update" "Recent software changes are a common cause of instability."
Add-Seed "Software Troubleshooting" "easy" "Which symptom is commonly associated with malware infection?" @("Unexpected pop-ups and slow performance", "Higher screen resolution", "Faster printing", "Longer battery life") "Unexpected pop-ups and slow performance" "Malware often causes pop-ups, slowness, and other abnormal behavior."
Add-Seed "Software Troubleshooting" "easy" "Which boot option is useful for diagnosing driver or startup issues with minimal services loaded?" @("Safe Mode", "Normal boot", "Hibernate", "BitLocker recovery") "Safe Mode" "Safe Mode is designed for troubleshooting startup and driver issues."
Add-Seed "Software Troubleshooting" "easy" "A user says the PC is very slow right after startup. What should be checked first in software?" @("Excessive startup programs", "The printer paper tray", "The Ethernet crimper", "The laptop hinge") "Excessive startup programs" "Too many startup apps can significantly slow the boot experience."
Add-Seed "Software Troubleshooting" "medium" "A system boots to a blue screen after a new driver install. What should you suspect first?" @("Driver conflict or bad driver", "Printer jam", "Wrong monitor input", "Dead CMOS battery") "Driver conflict or bad driver" "A recently installed driver is a high-probability cause of the BSOD."
Add-Seed "Software Troubleshooting" "medium" "What is a common first step when malware is suspected on a workstation?" @("Isolate the system from the network", "Increase the screen brightness", "Update the wallpaper", "Swap the keyboard") "Isolate the system from the network" "Isolation helps prevent spread or further malicious activity."
Add-Seed "Software Troubleshooting" "medium" "Which tool can be used to view and disable startup programs in Windows?" @("Task Manager Startup tab", "Disk Cleanup", "Character Map", "Control Mouse") "Task Manager Startup tab" "The Startup tab helps identify programs that load automatically."
Add-Seed "Software Troubleshooting" "medium" "A user cannot open a file because no application is associated with the extension. What is the likely issue?" @("Incorrect file association", "A failed PSU", "Bad toner", "Broken RJ45 clip") "Incorrect file association" "The OS may not know which application should open the file type."
Add-Seed "Software Troubleshooting" "medium" "Which symptom often points to low disk space affecting system performance?" @("Failed updates and temporary file errors", "A dim monitor", "Bluetooth pairing", "Dead pixels") "Failed updates and temporary file errors" "Low free space can interfere with updates and temporary file usage."
Add-Seed "Software Troubleshooting" "medium" "A web page loads only after clearing cookies and cache. What was likely resolved?" @("Corrupted browser data", "Bad motherboard traces", "Broken fan bearing", "Loose SODIMM") "Corrupted browser data" "Clearing cached browser data can resolve corrupted session or content issues."
Add-Seed "Software Troubleshooting" "medium" "Which built-in recovery option can revert Windows system files and settings to an earlier point?" @("System Restore", "BitLocker", "Task Scheduler", "Disk Defragmenter only") "System Restore" "System Restore can roll back system settings and drivers to a known-good state."
Add-Seed "Software Troubleshooting" "hard" "Which Windows command repairs protected operating system files from an elevated prompt?" @("sfc /scannow", "route print", "telnet", "hostname") "sfc /scannow" "System File Checker is used to repair protected system files."
Add-Seed "Software Troubleshooting" "hard" "What does quarantining a malicious file mean?" @("Isolating it so it cannot run normally", "Encrypting it for backup", "Adding it to startup", "Granting it admin rights") "Isolating it so it cannot run normally" "Quarantine prevents the file from executing while preserving it for review."
Add-Seed "Software Troubleshooting" "hard" "A browser homepage keeps resetting after reboot. Which type of issue is most likely?" @("Persistent adware or policy hijack", "Failed CPU cooler", "Bad monitor cable", "Broken trackpad") "Persistent adware or policy hijack" "Homepage changes that return repeatedly often point to adware or a managed policy."
Add-Seed "Software Troubleshooting" "hard" "Which recovery feature allows Windows to reinstall while keeping some user data depending on the option chosen?" @("Reset this PC", "Taskkill", "Check Disk", "Boot Order") "Reset this PC" "Reset this PC reinstalls Windows and can optionally keep user files."
Add-Seed "Software Troubleshooting" "hard" "Which symptom strongly suggests a software service failure rather than a hardware power issue?" @("A specific application feature will not start while the system stays powered on", "The PC has no lights at all", "The battery is swollen", "The fan never spins") "A specific application feature will not start while the system stays powered on" "A narrow feature outage on an otherwise powered system often points to a service or application issue."

Add-Seed "Operational Procedures" "easy" "Which item helps protect components from electrostatic discharge while working inside a PC?" @("ESD strap", "Toner vacuum", "Patch panel", "Loopback adapter") "ESD strap" "An ESD strap helps ground the technician and reduce static discharge risk."
Add-Seed "Operational Procedures" "easy" "Why should technicians use a ticketing system?" @("To track issues, actions, and handoff", "To avoid documenting work", "To disable user accounts", "To bypass approval") "To track issues, actions, and handoff" "Ticketing supports accountability and communication across support work."
Add-Seed "Operational Procedures" "easy" "Before working inside a PC, what should be done first?" @("Remove power and observe ESD safety", "Install printer drivers", "Reset all BIOS settings", "Delete temp files") "Remove power and observe ESD safety" "Power safety and ESD protection come first."
Add-Seed "Operational Procedures" "easy" "Which behavior best reflects professionalism when supporting users?" @("Communicate clearly and set expectations", "Use confusing jargon", "Promise impossible deadlines", "Skip documentation") "Communicate clearly and set expectations" "Professional support includes clear communication and realistic expectations."
Add-Seed "Operational Procedures" "easy" "What should be done before performing major maintenance that may affect users?" @("Follow change management and communicate", "Skip approvals to save time", "Disable logging", "Ignore backups") "Follow change management and communicate" "Change management reduces risk and keeps stakeholders informed."
Add-Seed "Operational Procedures" "medium" "Why is maintaining good backup practices important?" @("It helps recover data after loss or failure", "It speeds Wi-Fi throughput", "It improves toner quality", "It replaces MFA") "It helps recover data after loss or failure" "Backups are a core recovery control for accidental deletion, malware, or hardware failure."
Add-Seed "Operational Procedures" "medium" "Which fire safety device is appropriate for many energized electrical fires in IT spaces?" @("Class C extinguisher", "Class K extinguisher", "Garden hose", "Water bucket") "Class C extinguisher" "Class C extinguishers are intended for energized electrical equipment fires."
Add-Seed "Operational Procedures" "medium" "What is the benefit of using a written escalation path?" @("It ensures the issue reaches the right level of support", "It removes the need for tickets", "It bypasses approvals", "It guarantees instant repair") "It ensures the issue reaches the right level of support" "An escalation path helps route issues efficiently and appropriately."
Add-Seed "Operational Procedures" "medium" "What should a technician do before leaving a user workspace after onsite support?" @("Clean up tools and confirm the system works", "Leave packaging behind", "Disable security software", "Delete the ticket notes") "Clean up tools and confirm the system works" "A professional closeout includes confirming functionality and leaving the area tidy."
Add-Seed "Operational Procedures" "medium" "Why should sensitive information be handled carefully in support notes?" @("To protect privacy and reduce risk", "To make the ticket longer", "To increase CPU efficiency", "To improve monitor refresh rate") "To protect privacy and reduce risk" "Support documentation should avoid exposing unnecessary sensitive data."
Add-Seed "Operational Procedures" "medium" "What is the main purpose of an acceptable use policy?" @("Define proper and improper use of company technology", "Benchmark printer speed", "Assign IP addresses", "Calibrate displays") "Define proper and improper use of company technology" "Acceptable use policies define how organization technology should be used."
Add-Seed "Operational Procedures" "medium" "Which practice helps avoid data loss before major system work?" @("Verify backups first", "Disable updates permanently", "Remove all antivirus", "Change the wallpaper") "Verify backups first" "Confirming backups before risky work helps protect against data loss."
Add-Seed "Operational Procedures" "hard" "A user is frustrated during a long outage. Which response is best?" @("Acknowledge the impact and provide a clear update", "Argue with the user", "Blame another team without evidence", "End the call abruptly") "Acknowledge the impact and provide a clear update" "Empathy and clear status updates are key professionalism skills."
Add-Seed "Operational Procedures" "hard" "What is the purpose of a change window?" @("Schedule higher-risk work for an approved time", "Increase screen brightness", "Store passwords", "Test Wi-Fi coverage") "Schedule higher-risk work for an approved time" "Change windows help minimize business disruption and coordinate support."
Add-Seed "Operational Procedures" "hard" "Why should a technician label disconnected cables during a complex move?" @("To restore the system correctly afterward", "To boost internet speed", "To encrypt the drive", "To reset group policy") "To restore the system correctly afterward" "Labeling reduces mistakes when reconnecting equipment."
Add-Seed "Operational Procedures" "hard" "Which document typically defines the promised response or uptime expectation for support?" @("SLA", "ACL", "MBR", "POST") "SLA" "A service level agreement defines expected service targets."
Add-Seed "Operational Procedures" "hard" "Why is disposing of old drives securely important?" @("To prevent unauthorized data recovery", "To improve Wi-Fi range", "To reduce print streaks", "To calibrate batteries") "To prevent unauthorized data recovery" "Improper drive disposal can expose sensitive data."

$variants = @(
    "{0}",
    "Choose the best answer: {0}",
    "A certification-style practice question asks: {0}",
    "A technician reviewing for the exam sees this prompt: {0}"
)

function Rotate-Options {
    param(
        [string[]]$Options,
        [int]$Shift
    )

    if ($Options.Count -le 1) {
        return ,$Options
    }

    $normalized = $Shift % $Options.Count
    if ($normalized -eq 0) {
        return ,$Options
    }

    $front = @($Options[$normalized..($Options.Count - 1)])
    $back = @($Options[0..($normalized - 1)])
    return @($front + $back)
}

$questions = New-Object System.Collections.Generic.List[object]
$id = 1

foreach ($seed in $seeds) {
    for ($variant = 0; $variant -lt $variants.Count; $variant++) {
        $questions.Add([pscustomobject]@{
            id = $id
            domain = $seed.domain
            difficulty = $seed.difficulty
            question = [string]::Format($variants[$variant], $seed.question)
            options = @(Rotate-Options -Options $seed.options -Shift ($id + $variant))
            answer = $seed.answer
            explanation = $seed.explanation
        })
        $id += 1
    }
}

$output = $questions | Select-Object -First 600
$dataPath = Join-Path $PSScriptRoot "..\\data\\questions.json"
$output | ConvertTo-Json -Depth 5 | Set-Content $dataPath
Write-Output "Generated $($output.Count) questions at $dataPath"
