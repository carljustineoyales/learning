# Concept 2 — `tsc`, `tsconfig.json`, and Strictness

## Discussion
Running `tsc` with no configuration uses lenient default settings. A
`tsconfig.json` file controls how strict the checker is — the single most
important setting is `"strict": true`, which turns on a bundle of checks
(including refusing to treat `null`/`undefined` casually) that catch the
large majority of real beginner mistakes. It's far easier to start a project
strict than to switch a large one to strict later.

## Activity
`npx tsc --init` in the scratch folder, confirm `"strict": true` in the
generated `tsconfig.json`, re-run against the Concept 1 file.

**Expected result:** the same error as before, now governed by a permanent
config file rather than default behaviour.

## Result
`npx tsc tasks.ts` (filename passed directly) produced:

```
error TS5112: tsconfig.json is present but will not be loaded if files are
specified on commandline. Use '--ignoreConfig' to skip this error.
```

Real `tsc` behaviour, not a mistake — naming a file directly on the command
line bypasses `tsconfig.json` entirely, so newer `tsc` versions warn rather
than silently ignore `strict: true`.

Running `npx tsc` with no filename (reads `tsconfig.json` from the current
directory, compiles everything it includes) reproduced the same error as
Concept 1, now under `strict: true`:

```
tasks.ts:4:16 - error TS2345: Argument of type 'number' is not assignable to parameter of type 'string'.
4 formatPriority(3);
                 ~
Found 1 error in tasks.ts:4
```

## Notes
- Course script step "run `npx tsc tasks.ts`" doesn't account for TS5112
  once a `tsconfig.json` exists — use bare `npx tsc` from this point forward
  when a config file is present in the folder.
