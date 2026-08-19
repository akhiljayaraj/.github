# Platform repo — conventions for editing the dev platform

This is `akhiljayaraj/.github`, the **platform** repo. It holds the reusable
CI/CD logic and account-wide defaults that every project inherits. Changing
things here affects all projects, so be careful.

## What lives here
- `.github/workflows/ci.yml` — the reusable CI (lint/typecheck/unit/integration/build),
  language-agnostic via inputs. Called by projects as
  `akhiljayaraj/.github/.github/workflows/ci.yml@v1`.
- `.github/workflows/codeql.yml` — reusable CodeQL.
- `workflow-templates/dependabot.yml` — Dependabot config copied into new projects.
- `.github/ISSUE_TEMPLATE/`, `.github/PULL_REQUEST_TEMPLATE.md` — account-wide defaults.
- `CONTRIBUTING.md`, `.github/CODEOWNERS`, `labels.json` — shared conventions/labels.
- `scripts/link-project.sh`, `PROJECT.md` — shared project board (#1) linkage.

## The `v1` versioning ritual (IMPORTANT)
Projects pin the reusable workflows at `@v1`. A change to `ci.yml` or `codeql.yml`
on `main` does NOT reach any project until you move the tag:

```bash
git tag -f -a v1 -m "Platform v1: <what changed>" && git push -f origin v1
```

Forgetting this is the #1 way a "fix" silently doesn't take effect.

## Cross-repo consistency
The reusable CI's job names (`lint`, `typecheck`, `unit`, `integration`, `build`)
surface to callers as `ci / <job>`. If you rename a job, update the required
status-check contexts in `template-app/.platform/ruleset.json` to match, or future
branch protection will block merges on checks that never report.

## Platform caveats (not bugs)
Free plan + private repos: enforced rulesets and CodeQL are unavailable (need Pro
or public repos). Scripts handle this best-effort (warn and continue). The
ruleset JSON is already written correctly for when protection is enabled.

## Design docs
Spec, plan, and the build ledger live in `~/dev-platform/` (a separate docs repo).
