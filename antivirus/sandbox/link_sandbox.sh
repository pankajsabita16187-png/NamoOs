#!/bin/sh
# Simple disposable link check (very limited).
URL="$1"
TMPDIR=$(mktemp -d)
# Run curl in isolated user+network namespace where network is available but contained
# Note: in many systems unshare requires privileges. This is a scaffold.
unshare -U -n --mount-proc bash -c "curl -I --max-time 10 "$URL" > /tmp/namo_link_check.txt" || echo "Sandbox fetch failed"
cat /tmp/namo_link_check.txt || true
rm -rf "$TMPDIR"
