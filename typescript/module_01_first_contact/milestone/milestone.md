# Module 1 — Milestone

## Task
Write a brand-new, small function for TidyList in plain JavaScript first —
counting how many tasks in a list are marked complete. Then move to
TypeScript, run it through `tsc`, and fix everything flagged, without
changing what the function actually does.

## Status
✅ Complete — parameter typed as an inline object array
(`{ title: string; complete: boolean }[]`), compiles clean under `tsc`.
Explicit array-type syntax pulled forward slightly ahead of Module 2 out of
necessity (a bare parameter has nothing to infer a type from, so
`noImplicitAny` under `strict: true` forces an annotation); flagged rather
than silently absorbed.

## Code

```ts
function countCompleteTasks(tasks: { title: string; complete: boolean }[]) {
  let count = 0;
  for (const task of tasks) {
    if (task.complete) count++;
  }
  return count;
}

console.log(countCompleteTasks([
  { title: "Buy groceries", complete: true },
  { title: "Walk the dog", complete: false },
  { title: "Pay rent", complete: true },
]));
```

## Notes
- Compiling with `tsc` only writes `tasks.js` — it does not execute
  anything. Output confirmed separately via `node tasks.js`.
- Initial parameter typed with no annotation produced
  `TS7006: Parameter 'tasks' implicitly has an 'any' type` — the trigger for
  adding the inline array type above.

## Check Question 1 — Type Annotations at Compile Time vs. Runtime
**Question:** In your own words, explain what happens to your type
annotations between writing `tasks.ts` and a browser executing the
resulting JavaScript.

**Answer:** Type annotations are only in compile time, not in runtime, so
they will not appear in the browser.

**Follow-up note:** it's not that the annotations get hidden or reduced —
`tsc` deletes them outright when it emits the `.js` file, so there is
nothing left to see. This is why a value that slips past every compile-time
check (user input, an API response) gets zero protection once the code is
actually running — nothing is watching anymore.

## Check Question 2 — Second Function
A second function, `inc`, deliberately written with no parameter
annotations to reproduce the same class of error as above:

```ts
function inc(task, count) {
  if (task.complete) return count++;
}
```
```
tasks.ts:9:15 - error TS7006: Parameter 'task' implicitly has an 'any' type.
tasks.ts:9:20 - error TS7006: Parameter 'count' implicitly has an 'any' type.
```

Fixed by annotating both parameters:

```ts
type Task = { title: string; complete: boolean };
function inc(task: Task, count: number) {
  if (task.complete) return count++;
}
```
Compiles clean (`npx tsc` — no output).

**Known open issue (logic, not typing):** `count++` is post-increment — it
returns the pre-increment value, and since `count` is a plain `number`
parameter (not a reference), the increment does not persist for the caller
either way. When `task.complete` is `false`, the function falls through
with no `return`, implicitly returning `undefined` instead of `count`.
`tsc` does not catch this — it is valid TypeScript, just not doing what the
function name implies. Left unresolved by choice.

Also note: `type Task = {...}` (a type alias) is Module 2, Concept 5
material, pulled forward here ahead of being formally taught — same pattern
as the array-type pull-forward above.
