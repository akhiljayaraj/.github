# akhiljayaraj/.github

Platform repo: reusable workflows and account-wide community-health defaults.

## Versioning the reusable workflows

Projects pin the reusable workflows at `@v1`. When you change `ci.yml` or
`codeql.yml` on `main`, callers do NOT pick it up until the `v1` tag is moved:

    git tag -f -a v1 -m "Platform v1: <what changed>" && git push -f origin v1
