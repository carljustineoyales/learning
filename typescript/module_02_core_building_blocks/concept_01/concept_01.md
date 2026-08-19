# Concept 1 — Primitives: `string`, `number`, `boolean`

## Discussion
Annotate a variable with `: type` after its name. TypeScript checks every
future assignment to that variable against the annotation, permanently —
not only at the moment it's created.

## Activity
Declare `taskTitle: string`, `daysUntilDue: number`, `isComplete: boolean`
for a TidyList task, then try reassigning `daysUntilDue = "two"`.

**Expected result:** an error naming the exact mismatch
(`Type 'string' is not assignable to type 'number'`).

## Result
First attempt used `const daysUntilDue`, which surfaced a different error
first — `TS2588: Cannot assign to 'daysUntilDue' because it is a constant.`
Reassigning a `const` is illegal in plain JavaScript regardless of types,
so TypeScript enforces that rule before it even reaches the type check.

Switched to `let daysUntilDue: number = 2`, reran:

```
tasks.ts:4:1 - error TS2322: Type 'string' is not assignable to type 'number'.
4 daysUntilDue = "two";
  ~~~~~~~~~~~~
```

Matches expected result exactly.

## Notes
- `const` vs `let` matters for reassignment activities — `const` will hit a
  JS-level error (`TS2588`) before a type-mismatch error ever gets the
  chance to appear.
