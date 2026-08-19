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
Not yet answered — pending before Module 2 opens.

1. In your own words, explain what happens to your type annotations between
   writing `tasks.ts` and a browser executing the resulting JavaScript.
2. Write a second small function for TidyList, deliberately introduce one
   type error in it, then fix it. Show both the error and the fix.

## Status
🔄 In progress — all four concepts complete, milestone code written and
compiling clean, check questions outstanding.
