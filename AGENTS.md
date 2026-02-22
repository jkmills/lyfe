# Repository Guidelines

## Project Structure & Module Organization
Lyfe is still in its bootstrap phase, so contributors set the tone for the layout. Keep executable code under `src/` (create feature-specific subfolders such as `src/ui` or `src/services`) and mirror each module with a sibling spec in `tests/`. Shared media or mock data belongs in `assets/`, while long-form design notes fit under `docs/`. Avoid scattering scripts at the root—place helper CLIs in `scripts/` and reference them from package.json so they can be run uniformly.

## Build, Test, and Development Commands
Install dependencies with `npm install` and run the live desktop shell through `npm run dev` (hot-reloads Electron once it exists). Package production builds with `npm run build`, which should emit artifacts into `dist/`. Unit and integration suites live behind `npm test`, while `npm run lint` executes the configured formatter/linter stack; wire these scripts up before opening a pull request.

## Coding Style & Naming Conventions
Default to TypeScript when possible, using 2-space indentation and trailing commas for multi-line constructs. Components and services should use PascalCase filenames (`WeatherPanel.tsx`), hooks/utilities use camelCase (`useLocale.ts`). Prefer named exports, keep modules under 300 lines, and document edge cases with terse comments. Run the formatter (`npm run lint -- --fix`) before committing so imports, spacing, and ordering stay consistent.

## Testing Guidelines
Adopt Vitest or Jest for fast feedback and place specs beside the relevant feature in `tests/<feature>` (e.g., `tests/weather/WeatherPanel.test.tsx`). Name files `<Unit>.test.ts` and favor deterministic fixtures over network calls. Aim for 80% line coverage minimum; use `npm test -- --coverage` locally and call out gaps explicitly in the PR if a waiver is needed.

## Commit & Pull Request Guidelines
Write conventional commits (`feat: add live wallpaper data source`) and keep messages under 72 characters. Each PR should describe rationale, screenshots of UI changes, reproduction steps, and linked issues. Rebase onto `main`, ensure CI scripts (`npm run lint && npm test`) are green, and request a review only after comments are addressed. Keep PRs scoped to a single atomic change so history stays readable.

## Security & Configuration Tips
Do not commit API tokens or platform certificates; load sensitive material through `.env.local` (never checked in) and document required keys in `docs/configuration.md`. Review third-party packages before adoption, and prefer built-ins unless there is a measurable benefit.
