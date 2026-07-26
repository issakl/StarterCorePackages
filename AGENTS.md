# AGENTS.md

Guidance for Codex when working in this repository.

## What this repo is

Monorepo of shared packages for Starter-based Flutter apps, developed
together via a Dart pub workspace (see root `pubspec.yaml`'s `workspace:`
list) but **consumed individually** by apps as `git:` dependencies pinned
to a commit SHA — apps are not part of this workspace.

- `starter_core` — foundational entities, results, errors, enums
- `starter_infra` — networking + local storage
- `starter_localization` — generated `CoreS` strings (shared/baseline)
- `starter_ui` — shared widgets, theme, navigation (depends on the other
  three via sibling `path:` deps)

## Developing here

Run `flutter pub get` at this root (not inside an individual package) —
the workspace shares one resolution and one `pubspec.lock`.

## The "pin every package to the same commit" rule

Because `starter_ui` and `starter_infra` depend on their sibling packages
via `path:` internally, a consuming app **must** pin all four `ref:`
values (in its own `pubspec.yaml`) to the exact same commit SHA — never a
branch name, and never different SHAs per package. Mixing sources (or
SHAs) for the same package makes pub's solver fail with a "version solving
failed" error naming the conflicting package. Full explanation and the
exact error text: `README.md`.

There's no semver here: a `git:` dependency always pins to one exact ref
(branch/tag/commit) — pub doesn't do range resolution against a git
source. If a "real" version constraint (`^0.2.0`-style) is ever wanted,
that requires actually publishing these packages to a pub-compatible
registry (pub.dev itself if they can be public, or a self-hosted
alternative like `unpub` / a private artifact feed otherwise) — not set up
today. Short of that, tagging a commit here with a version-like git tag
(e.g. `v0.2.0`) and using `ref: v0.2.0` instead of a raw SHA is the
closest practical improvement — still a single exact pin, but human
readable, and it must still be the same tag across all four packages a
consumer imports.

## Pushing changes

**This repo is a shared dependency — a push here affects every app that
pins `ref: main`-adjacent commits going forward, and is invisible to apps
still pinned to an older SHA until they explicitly bump it.** Local
commits are low-risk and fine to make; before pushing to `origin`
(`git.zkood.com`), confirm with the user first, the same as any action
that touches shared/remote state outside this one repo.

Consuming apps can develop against uncommitted local changes here before
pushing by adding a temporary `path:`-based `dependency_overrides` block
for all four packages in their own `pubspec.yaml` (all four together, per
the rule above) — remove it once this repo's change is pushed and the
consumer's `ref:` values are bumped to match.

## `starter_localization` specifics

Generates `CoreS` (not `S`) — renamed deliberately so each consuming app
can add its own local `S` (its own `flutter_intl` config, generating from
its own `lib/l10n/*.arb`) for app-specific strings without colliding with
this package's class name. See that package's `lib/starter_localization.dart`
doc comment.

To change a shared string: edit `starter_localization/lib/l10n/*.arb`
(`intl_en.arb`, `intl_ar.arb`, `intl_ar_IQ.arb`), then regenerate from
inside that package:

```bash
cd starter_localization
dart run intl_utils:generate
```

This regenerates `lib/l10n.dart` and `lib/intl/messages_*.dart` — never
hand-edit those (see the "GENERATED CODE - DO NOT MODIFY BY HAND" header).

Note: the generated delegate class is always named `AppLocalizationDelegate`
regardless of `class_name` — that's hardcoded by the `intl_utils`
generator, not something this package controls. Consuming apps that also
generate their own local `S` (with its own `AppLocalizationDelegate`) need
an import prefix on whichever import brings in the second one, wherever
both are registered together (see the consuming app's own CLAUDE.md).

## Authenticating against the private remote

See `README.md` for the three supported options (SSH key, HTTPS token via
git config, `.netrc`) — never put a token directly in a `url:` field in
any `pubspec.yaml`, here or in a consumer.
