# Application Artifact Integrity Monitoring (PowerShell)

##  Overview

This project demonstrates integrity validation of application release artifacts using SHA-256 hashing in a Windows environment.

The objective is to simulate protection against software update tampering and supply chain compromise.

---

##  Real-World Scenario

A SaaS company publishes downloadable software updates.

If an attacker modifies the release package before distribution, customers may download a malicious version containing:

- Backdoor code
- Remote access payloads
- Data exfiltration mechanisms

To mitigate this risk, integrity verification is performed before release.

---

##  Security Control Implemented

1. Generate SHA256 hash for official release artifact.
2. Store baseline hash securely.
3. Recalculate hash before release.
4. Compare values.
5. Trigger corrective action if modification detected.

---

##  Implementation

### Step 1 – Generate Baseline Hash

```powershell
Get-FileHash ./app_update_v3.4.2.zip -Algorithm SHA256 |
Select-Object -ExpandProperty Hash |
Set-Content ./release_hash.txt

This represents build server verification.

Step 2 – Integrity Validation Script

The filecheck.ps1 script:

Recalculates current hash

Compares with baseline

Prints validation status

Initiates corrective action if modified

Demonstration
✔ Before Tampering
This file is correct. No corrective action needed.
❌ After Tampering
This file has changed. Corrective action initiated.

Security Risks Addressed:

Supply chain attacks

Build artifact manipulation

Insider modification

Unauthorized file replacement

Release pipeline compromise

Security Principles Applied:

Integrity validation

Trust boundary enforcement

Release artifact verification

Secure software distribution practices

Technologies Used:

Windows PowerShell

SHA-256 hashing

File integrity monitoring concepts

Why This Project Matters

Modern application security extends beyond code vulnerabilities.

Protecting build artifacts and verifying release integrity is critical in preventing supply chain compromise.

This project demonstrates practical implementation of that control in a Windows environment.
