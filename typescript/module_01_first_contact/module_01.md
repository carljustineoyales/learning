# Module 1 — First Contact: Seeing TypeScript Catch a Mistake Before It Happens

## Opening Analogy
Imagine TidyList already has a function that expects a task's priority to be
handed in as a word — `"low"`, `"medium"`, `"high"` — and somewhere else in
the app, a number gets passed in instead by mistake. In plain JavaScript,
nothing objects until that number causes something visibly wrong later,
possibly in a completely different part of the app, making it hard to trace
back. TypeScript is an inspector arriving on site for the first time. It
doesn't rebuild anything — it reads the blueprint you've written (the type),
reads the part being attached (the value), and tells you immediately if they
don't match, before anything gets a chance to go wrong downstream.

## Concepts
1. [[concept_01/concept_01|What TypeScript Actually Is]] — done
2. [[concept_02/concept_02|`tsc`, `tsconfig.json`, and Strictness]] — done
3. [[concept_03/concept_03|Editor Feedback Loop vs. Compile Step]] — done
4. [[concept_04/concept_04|`any`, the Escape Hatch]] — done

## Milestone
See [[milestone/milestone|Milestone]] — in progress, code written and
compiling clean, check questions outstanding.

## Check Questions
Answered 2026-08-19.

1. Type annotations exist only at compile time. `tsc` deletes them entirely
   when emitting the `.js` file — nothing is hidden or reduced, there is
   simply nothing left. A browser never sees a type, which is why a value
   that slips past every compile-time check (user input, an API response)
   gets zero protection once the code is actually running — nothing is
   watching anymore.
2. Deliberately introduced type error (bare parameters, `noImplicitAny`
   under `strict: true`):

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

   **Known open issue (logic, not typing):** `count++` is post-increment —
   it returns the pre-increment value, and since `count` is a plain `number`
   parameter (not a reference), the increment does not persist for the
   caller either way. When `task.complete` is `false`, the function falls
   through with no `return`, implicitly returning `undefined` instead of
   `count`. `tsc` does not catch this — it is valid TypeScript, just not
   doing what the function name implies. Left unresolved by choice; noted
   here rather than silently fixed.

   Also note: `type Task = {...}` (a type alias) is Module 2, Concept 5
   material, pulled forward here ahead of being formally taught — same
   pattern as the array-type pull-forward in the milestone.

## Status
✅ Complete — all four concepts, milestone, and check questions done.
