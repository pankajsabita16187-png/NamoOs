Antivirus subsystem:
- scanner/: C++ scanner stubs that detect URLs in SMS and call static scanners.
- rules/: blacklist files (urls, numbers) and hosts.block which currently contains Facebook entries.
- sandbox/link_sandbox.sh: runs a fetch in a new user/net namespace as a disposable check.

DISCLAIMER: These are stubs and must be adapted for production. Use YARA/ClamAV for real detection.
