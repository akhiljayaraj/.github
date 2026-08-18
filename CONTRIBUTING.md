# Contributing

## Branching
- `main` is protected. Never push to it directly.
- Branch names: `feat/<slug>`, `fix/<slug>`, `chore/<slug>`.

## Workflow
1. Create/assign an issue; move it to **In progress** on the board.
2. Branch, commit in small steps.
3. Open a PR; fill the template; link the issue with `Closes #NNN`.
4. CI must be green and one review approved before squash-merge.

## Running tests locally
- `npm ci` then `npm test` (or `just test`). See the project README for stack-specific commands.

## Reviews
- CODEOWNERS auto-requests reviewers. Address comments with follow-up commits (approvals reset on new commits).
