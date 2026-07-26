# corepackages

Shared core packages for Starter-based apps, extracted from the main
monorepo so they can be versioned and consumed independently:

- `starter_core` — foundational entities, results, errors, enums
- `starter_infra` — networking + local storage
- `starter_localization` — generated `S` strings
- `starter_ui` — shared widgets, theme, navigation

Developed together via a Dart pub workspace (`pubspec.yaml` / `melos.yaml`
at this root) — run `flutter pub get` here to work on them locally. Apps
consume them individually as git dependencies; they are not part of the
consuming app's own workspace.

## Importing into an app

Add each package you need as a `git` dependency, pointing `path:` at its
subdirectory in this repo:

```yaml
dependencies:
  starter_core:
    git:
      url: <this-repo's-url>
      path: starter_core
      ref: main   # pin to a tag or commit once this stabilizes
  starter_ui:
    git:
      url: <this-repo's-url>
      path: starter_ui
      ref: main
```

`ref: main` floats with the branch — fine for active development, but once
this settles down, pin `ref` to a tag or commit SHA so consumers don't get
surprised by upstream changes.

## Authenticating against a private remote

Once this repo is pushed somewhere private, `url:` above becomes a real
remote (e.g. `git@git.zkood.com:dart/corepackages.git` or
`https://git.zkood.com/dart/corepackages.git`). **Never put a token inside
that URL or in `pubspec.yaml`** — both get committed and read by anyone
with repo access. `dart pub get` shells out to your system `git`, so
whichever of the following you set up is transparent to pub; nothing in
this repo or the consumer's pubspec.yaml needs to change.

### Option A — SSH (recommended, no token at all)

Use an SSH remote URL and let SSH keys handle auth — nothing secret ever
touches a config file pub reads:

```yaml
url: git@git.zkood.com:dart/corepackages.git
```

- Locally: your existing `~/.ssh` key already used for `git.zkood.com` just works.
- CI: add a deploy key (read-only, scoped to this one repo) as a masked secret,
  written to `~/.ssh/id_ed25519` before `flutter pub get` runs.

### Option B — HTTPS + token, kept out of the repo entirely

Keep the URL in `pubspec.yaml` clean (`https://git.zkood.com/dart/corepackages.git`,
no credentials in it) and tell git to inject the token only on this machine:

```bash
git config --global url."https://oauth2:$TOKEN@git.zkood.com/".insteadOf "https://git.zkood.com/"
```

- `$TOKEN` is a personal/deploy access token from git.zkood.com, exported in
  your shell (or a CI secret) — never written into any tracked file.
- Every `git`/`pub` operation against `https://git.zkood.com/...` is
  transparently rewritten to include the token, so `pubspec.yaml` never
  needs it.
- In CI, run that `git config` line as a setup step, sourcing `$TOKEN` from
  the CI provider's encrypted secrets — before `flutter pub get`.

### Option C — `.netrc`

Alternative to Option B if you'd rather not touch global git config:

```
machine git.zkood.com
login <token-or-username>
password <token>
```
in `~/.netrc` (`chmod 600 ~/.netrc`). Git picks this up automatically for
HTTPS auth.

Avoid embedding the token directly in the `url:` field (e.g.
`https://<token>@git.zkood.com/...`) — that string ends up in
`pubspec.yaml`, `pubspec.lock`, and every clone's git history the moment
it's committed.
