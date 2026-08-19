# Concept 1 — What TypeScript Actually Is

## Discussion
TypeScript is JavaScript with type annotations added on top. The TypeScript
compiler (`tsc`) reads a `.ts` file, checks every annotation against how
values are actually used, then strips all the type information out and
produces plain `.js`. The browser and Node.js never see a type — by the time
the code runs, TypeScript has already finished checking it and stepped out
of the way.

## Activity
`npm install -D typescript` in a scratch folder, create `tasks.ts`:

```ts
function formatPriority(priority: string) {
  return priority.toUpperCase();
}
formatPriority(3);
```

Run `npx tsc tasks.ts`.

**Expected result:** `tsc` reports an error naming the mismatch
(`Argument of type 'number' is not assignable to parameter of type 'string'`).

## Result
Ran cleanly against expectation:

```
tasks.ts:4:16 - error TS2345: Argument of type 'number' is not assignable to parameter of type 'string'.
4 formatPriority(3);
                 ~
Found 1 error in tasks.ts:4
```

## Notes
- Passing a filename directly to `tsc` (e.g. `npx tsc tasks.ts`) compiles
  only that file with default settings and ignores `tsconfig.json` if one is
  present later — this surfaces properly in Concept 2.
