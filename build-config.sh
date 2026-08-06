#!/usr/bin/env bash
# ────────────────────────────────────────────────────────────────
# Cloudflare Pages build command:  bash build-config.sh
#
# Writes the runtime config.js (git-ignored) from the project's
# environment variables so the flow URLs never live in git.
# Define the five variables as encrypted env vars under
# Pages project → Settings → Environment variables (Production).
# Shape is documented in config.example.js.
# ────────────────────────────────────────────────────────────────
set -euo pipefail

# Guard: only run on Cloudflare's build machines (CF_PAGES=1 is set there).
# Running this locally would overwrite the developer's real config.js.
if [ "${CF_PAGES:-}" != "1" ]; then
  echo "Refusing to run outside Cloudflare Pages (would overwrite local config.js)." >&2
  exit 1
fi

cat > config.js <<EOF
window.RSM_CONFIG = {
  SUBMIT_URL: "${SUBMIT_URL:-}",
  OPTIONS_URL: "${OPTIONS_URL:-}",
  REQUESTS_URL: "${REQUESTS_URL:-}",
  UPDATE_STATUS_URL: "${UPDATE_STATUS_URL:-}",
  ARCHIVE_URL: "${ARCHIVE_URL:-}"
};
EOF

echo "config.js written ($(wc -c < config.js) bytes)"
