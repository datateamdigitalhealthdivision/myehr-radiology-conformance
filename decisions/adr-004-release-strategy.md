# ADR-004: Release Strategy

## Status

Accepted

## Context

The repository needs a practical publication approach that supports early drafting, vendor access, and eventual stable national releases.

## Decision

Use `main` as the active working branch, GitHub Pages for the rendered guide, semantic versioning beginning at `0.1.0`, and GitHub Releases for milestone packages and artefact downloads.

## Consequences

- vendors can track a stable release line and a newer continuous build
- publication remains lightweight and transparent
- future formal governance can extend rather than replace this model
