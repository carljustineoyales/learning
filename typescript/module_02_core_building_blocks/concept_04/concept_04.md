# Concept 4 — `any`, `unknown`, and `never`

## Discussion
`any` disables checking entirely, as seen in Module 1. `unknown` is the
safer alternative for genuinely uncertain data — it accepts any value but
*refuses to let you use it* until you've proven what it actually is.
`never` marks something that provably cannot happen, most often seen in
exhaustive `switch` statements or functions that only ever throw an error.

## Activity
```ts
const savedData: unknown = JSON.parse('{"title":"Buy groceries"}');
savedData.title;
```
**Expected result:** direct access errors. Then wrap in a narrowing guard:
```ts
if (typeof savedData === "object" && savedData !== null && "title" in savedData) {
  savedData.title;
}
```
**Expected result:** guarded access compiles clean.

## Result
Direct access:
```
tasks.ts:2:1 - error TS18046: 'savedData' is of type 'unknown'.
2 savedData.title;
  ~~~~~~~~~
Found 1 error in tasks.ts:2
```

Guarded access: no output (compiles clean).

Both match expectation exactly — this is the first taste of narrowing,
formally covered in Module 3.
