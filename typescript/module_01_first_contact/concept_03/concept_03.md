# Concept 3 — The Editor Feedback Loop vs. the Compile Step

## Discussion
VS Code (or any TypeScript-aware editor) runs the same type-checker live, as
you type, showing errors as red squiggly underlines. Running `tsc` from the
terminal is what actually produces the output `.js` file and is what a real
project relies on before running the code — the editor is for fast feedback
while writing, the compile step is what genuinely enforces things.

## Activity
Change `formatPriority(3)` to `formatPriority(true)` in the editor and watch
for the red squiggle, without running any terminal command.

**Expected result:** the error appears inline within a second or two, worded
almost identically to the terminal error from Concept 1.

## Result
Editor reported:

```
Argument of type 'boolean' is not assignable to parameter of type 'string'.
```

Matches expectation — same checker as `tsc`, same wording, mismatch named
correctly for the new argument type (`boolean` instead of `number`), no
terminal run needed.
