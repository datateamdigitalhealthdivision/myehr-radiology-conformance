# 08 Release And Versioning

## Release model

This repository uses a simple semantic versioning model starting at `0.1.0`.

- `main` is the active working branch
- continuous integration builds every change
- milestone versions are published as Git tags and GitHub Releases
- the FHIR package version matches the repository release version

## Continuous build

The continuous build represents the latest draft state of the repository. It may include content that is ahead of the latest tagged release. Vendors should use tagged releases for stable implementation unless specifically participating in sandbox testing of the current build.

## Release criteria

Before creating a tagged release:

- the FHIR IG must build successfully
- example artefacts and CapabilityStatements must be in sync with profiles
- key narrative chapters must reflect the shipped artefacts
- known provisional items must be clearly marked

## Package-list policy

The IG package-list should expose:

- a continuous build entry
- tagged milestone releases starting at `0.1.0`

## Suggested release workflow

1. Merge approved content into `main`.
2. Run the CI build and confirm publication output.
3. Tag the release, for example `v0.1.0`.
4. Publish GitHub Release notes summarising new artefacts, changes, and unresolved provisional items.
5. Retain packaged IG artefacts in release assets for vendor download.

## Versioning guidance for breaking changes

While the repository remains pre-1.0, any materially breaking change should still be documented clearly in release notes and ADRs. Once a national baseline is stabilised, versioning policy can be tightened further.
