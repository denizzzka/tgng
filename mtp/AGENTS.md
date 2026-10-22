# AGENTS.md — mtp

Autonomy applies only to work inside `mtp/`.

## Work autonomously

Do not ask questions or wait for confirmation while executing the plan. Decide, implement, test, commit, continue to the next step.

Decisions taken on your own belong in a commit: code, tests, and a message saying what was chosen and why.

## Do silently

- Pick package/module/type/function names, signatures, and file layout.
- Choose algorithms, data structures, and dependencies inside `mtp/dub.sdl`.
- Copy or rework code from other packages in this repository into `mtp/`.
- Write, rewrite, split, or delete files and tests that you created yourself in `mtp/`.
- Add, extend, replace, and delete unit tests and fixtures.
- Take test vectors from TDLib, RFCs, NIST, and official Telegram clients; record the source in a comment.
- Create, amend, squash, and commit git history on the current `mtp` branch.
- Add small helper executables and test subpackages under `mtp/`.
- Update `mtp/PLAN.md` to match what was actually done.
- Skip a plan item and record why, if it turns out to be unnecessary or blocked.

## Never silently

- Touch files outside `mtp/`, including the root `dub.sdl` beyond the already-added `subPackage` line, and the old `mtproto` package.
- Force-push, rewrite other people's commits, or delete branches.
- Create issues, pull requests, or comments on any remote.
- Commit credentials, real `api_id`/`api_hash`, phone numbers, or session keys.
- Do anything that cannot be undone by `git revert` inside `mtp/`.
