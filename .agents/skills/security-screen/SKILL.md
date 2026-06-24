---
name: security-screen
description: >
  Sanitizes input strings by scrubbing PII (SSNs and credit cards) and
  detecting prompt injection attempts before sending data to LLMs or logs.
---

# Security Screen Skill

This skill provides utilities to sanitize untrusted user inputs (like descriptions, comments, or prompt strings) before they are passed to an LLM or logged.

## Key Features

1.  **PII Scrubbing**: Searches for and redacts Social Security Numbers (SSN) and Credit Card numbers to prevent accidental data leaks to third-party APIs and system logs.
2.  **Prompt Injection Defense**: Scans inputs for known injection vectors trying to override system prompts, bypass corporate rules, or force auto-approvals.

## Usage

Import the helper module from `scripts/security_sanitize.py` in your python code:

```python
from security_sanitize import sanitize_input

result = sanitize_input(user_description)
if result["is_security_event"]:
    # Route straight to human/bypass LLM
    flag_security_alert(result["security_flag_reason"])
else:
    # Safe to send sanitized_text to LLM
    process_with_llm(result["sanitized_text"])
```
