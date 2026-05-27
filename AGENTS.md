# AGENTS.md — AI Agent Instructions for DeadEnd DNS Filter

## 🎯 Project Overview
**DeadEnd** is an enhanced and optimized DNS filter specifically designed for **AdGuard Home**.
It provides comprehensive blocking of advertising, tracking, malware, and other unwanted domains.

- **Type:** DNS Blocklist / Filter List
- **Format:** AdGuard Home compatible (`filter.txt`)
- **Purpose:** Block ads, trackers, malware, telemetry, CNAME cloaking, annoyances
- **Target Platform:** AdGuard Home only
- **License:** MIT

## 📁 Project Structure

### Core Files
- `filter.txt` — The main compiled blocklist (auto-generated, do not manually edit).
- `inclusions.txt` — Explicit list of domains to block. **This is the primary file for manual additions.**
- `exclusions.txt` — Explicit list of domains to never block (allowlist/whitelist) to resolve false positives.
- `configuration.json` — Build configuration (e.g., source URLs for external lists, aggregation rules).

### Build System
- The project uses a **Node.js** build script (managed via `package.json` and `yarn.lock`) to compile external sources and manual inclusions into the final `filter.txt`.
- **Build Command:** `yarn build` (generates `filter.txt`).
- **Test Command:** `yarn test` (validates syntax and checks for duplicates/conflicts).

### Automation (GitHub Actions)
- CI pipeline in `.github/workflows/build.yml` handles:
    1.  **Scheduled Builds:** Regularly updates `filter.txt` by fetching latest external lists and running the build script.
    2.  **Dependency Updates:** Dependabot keeps Node.js dependencies in `package.json` up-to-date.
    3.  **Validation & Security:** Runs linters, checks for dead domains, and performs `yarn audit` on dependencies.

## 🚫 Critical Rules & Anti-Patterns

### ❌ NEVER do this:
1.  **Manually edit `filter.txt`.** It is an auto-generated output file. Changes will be overwritten on the next build.
2.  **Add entries to `inclusions.txt` without a proper domain format.** Only use valid domains or AdGuard syntax (e.g., `||example.com^`).
3.  **Remove entries from `exclusions.txt` to "fix" a block.** This will cause a conflict with external lists and will be flagged by the CI tests.
4.  **Commit changes to `filter.txt` outside of the automated build process.**

### ✅ ALWAYS do this:
1.  **To block a new domain:** Add its entry (following AdGuard syntax) to `inclusions.txt`.
2.  **To resolve a false positive (unblock a domain):** Add the domain to `exclusions.txt`.
3.  **To add a new source:** Update the source list array in `configuration.json`.
4.  **After any change to these files:** Run `yarn test` locally to validate the changes before committing.
5.  **When closing issues:** Reference the commit that added the domain to `inclusions.txt` or `exclusions.txt` and note it will be available in the next automated build release.

## 📝 Issue & Pull Request Guidelines

### Issue Handling
- **Bug Reports (False Positives/Negatives):** Must include the exact domain, why it should (not) be blocked, and a link to a site or service where it occurs.
- **New Domain Requests:** Should include the domain category (Ads, Tracking, Malware, etc.) and an optional reference (e.g., an external blocklist where it's found).
- **Questions/Support:** Direct to the template asking for the AdGuard Home version and how the filter was added.

### Pull Request Expectations
- **Do not PR changes to `filter.txt`.**
- PRs **must** only modify `inclusions.txt`, `exclusions.txt`, `configuration.json`, or build-related files (`package.json`, CI scripts).
- PRs must pass all CI checks: `yarn audit`, `yarn test`, and any linter checks (e.g., EditorConfig).
- Keep PRs small: ideally one domain addition/fix per PR for clear history, unless it's a batch update from a verified source.

## ⚙️ Build & Test Commands (for CI/Local)

```bash
# Install dependencies
yarn install --frozen-lockfile

# Run syntax and logic checks
yarn test

# Generate the final filter.txt file
yarn build

# Security audit dependencies
yarn audit
```

## 🏷️ Key Conventions

- **Syntax:** Strictly follow the AdGuard rule syntax (see `Adblock Filter List` language in repo).
- **Commit Messages:** Use conventional commits (e.g., `fix: unblock legitimate banking service`, `feat: add new anti-telemetry list`).
- **Branching:** All non-trivial changes happen in feature branches. `main` branch is the source of truth and the base for releases.
- **Versioning:** Use `npm version patch|minor|major` (or yarn equivalent) to bump version in `package.json` before creating a release tag.
- **File Encoding:** All `.txt` and `.json` files must be UTF-8 with LF line endings (enforced by `.editorconfig`).
