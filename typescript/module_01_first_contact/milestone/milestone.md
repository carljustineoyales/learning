# Module 1 — Milestone

## Task
Write a brand-new, small function for TidyList in plain JavaScript first —
counting how many tasks in a list are marked complete. Then move to
TypeScript, run it through `tsc`, and fix everything flagged, without
changing what the function actually does.

## Status
In progress — parameter typed as an inline object array
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
