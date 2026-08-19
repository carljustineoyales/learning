# Module 2 — Milestone

## Task
Using only primitives, arrays, and tuples from this module, write a typed
shape (inline object type or `type` alias) for a single TidyList task, and
declare one constant object that satisfies it.

## Status
✅ Complete — compiles clean.

## Code
```ts
type Task = {
  id: number,
  title: string,
  subTasks: string[]
  categoryIds: [number,number],
  complete: boolean,
  date: [number,string,number]
}

const task: Task = {
  id: 1,
  title: "This is a title",
  subTasks: ["title2", "title3"],
  categoryIds:[1,2],
  complete:false,
  date: [2026, "November", 28]
}
```

## Notes
- First draft omitted `boolean` (only had `string`, `number`, `string[]`,
  and a tuple) — flagged for incomplete primitive coverage per the task
  brief, then `complete: boolean` was added.
- `categoryIds: [number, number]` uses a tuple for two same-meaning values
  (two category IDs), which isn't quite tuple's intended use — a tuple's
  positions are meant to carry different meanings by position (e.g.
  `[hours, minutes]`), not represent "two of the same thing" (that's what
  `number[]` is for). Left as-is since it still correctly demonstrates
  tuple syntax; not idiomatic, flagged rather than corrected.

## Check Question 1 — How Inference Actually Works
**Question:** Explain, without saying "TypeScript guesses," how
`const x = 5` ends up typed as `number` with no annotation present.

**First answer (rejected):** "TypeScript is smart enough to infer the type
based on the value" — restated "guesses" as "smart enough," didn't actually
explain the mechanism.

**Revised answer:** TypeScript checks the literal value and infers the
type from it.

**Follow-up note:** more precisely — when a variable is declared and
initialised in the same statement, TypeScript reads the literal value on
the right-hand side and assigns the narrowest type that value belongs to.
`5` is a `number` literal, so `x` is typed `number`. This is a direct,
mechanical read of the value at the point of declaration, not a heuristic
or AI-style guess.

## Check Question 2 — Tuple With a Failing Case
**Question:** Write a tuple type for a real two- or three-part value in
TidyList and show one value that satisfies it and one that fails.

**Answer:** Used `date: [number, string, number]` from the milestone
shape (`[year, month, day]` — month as a string, e.g. `"November"`).

**Satisfying value:**
```ts
date: [2026, "November", 28]
```
Compiles clean.

**Failing value:**
```ts
date: [2026, "November", 28, "test"]
```
```
tasks.ts:16:3 - error TS2322: Type '[number, string, number, string]' is not assignable to type '[number, string, number]'.
  Source has 4 element(s) but target allows only 3.
16   date: [2026, "November", 28, "test"]
     ~~~~
  tasks.ts:7:3 - The expected type comes from property 'date' which is declared here on type 'Task'
    7   date: [number,string,number]
        ~~~~
Found 1 error in tasks.ts:16
```
Correctly named as a length mismatch (4 elements vs. 3), with the error
pointing back to the `date` field's declaration.
