/* ────────────────────────────────────────────────────────────────
   TEMPLATE — copy to  config.js  (repo root) and paste in your URLs.
   config.js is git-ignored; in production the Cloudflare Pages build
   (build-config.sh) writes it from the project's build secrets.
   Shared by /request/ and /board/.
   ──────────────────────────────────────────────────────────────── */
window.RSM_CONFIG = {
  SUBMIT_URL: "",         // Flow A — POST, receive a submitted request
  OPTIONS_URL: "",        // Flow B — GET,  dropdown options for the form
  REQUESTS_URL: "",       // Flow C — GET,  all requests for the kanban board
  UPDATE_STATUS_URL: "",  // Flow D — POST, update one request's Status { id, status }
  ARCHIVE_URL: ""         // Flow E — POST, archive/restore one request { id, archived }
};
