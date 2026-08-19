# Concept 4 — `any`, the Escape Hatch (Used Deliberately for Now)

## Discussion
Annotating a value as `any` tells TypeScript to stop checking it entirely —
the inspector waves it through without reading the blueprint. It exists for
real reasons (covered properly in Module 2), but reaching for it just to
silence an error defeats the entire point of using TypeScript in the first
place.

## Activity
Change `formatPriority`'s parameter from `priority: string` to
`priority: any`, call it again with a mismatched argument.

**Expected result:** the error disappears entirely. Notice that the value
wasn't fixed — the check was simply switched off.

## Result
Confirmed — error gone, both in the editor and in `tsc`. `any` disabled
checking on the parameter rather than resolving the underlying mismatch.

## Common Beginner Traps (module-wide)
- **Assuming `tsc` blocks bad output by default:** by default `tsc` reports
  errors but still writes the `.js` file. Add `"noEmitOnError": true` to
  `tsconfig.json` if the build should stop outright on error.
- **Reaching for `any` the moment an error is annoying:** read what the
  error actually says first — it's almost always pointing at a genuine
  mistake worth fixing, not a false alarm.
- **Believing a compiled `.js` file is permanently "safe" because it came
  from `.ts`:** types are erased entirely once compiled — a wrong value
  handed to that same function later, from something TypeScript never
  checked (e.g. user input from a form), gets no protection at all. This
  resurfaces in Module 7.
