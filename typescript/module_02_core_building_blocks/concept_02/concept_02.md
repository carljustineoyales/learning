# Concept 2 — Type Inference

## Discussion
When you initialise a variable without an annotation, TypeScript infers the
type from the value itself and enforces it exactly as if you'd typed it
explicitly. Annotating obvious values by hand is extra typing, not extra
safety.

## Activity
Remove all three annotations from Concept 1, hover each variable name in
the editor.

**Expected result:** the hover tooltip shows the same inferred types
(`string`, `number`, `boolean`) with no annotation written.

## Result
Confirmed correctly for all three:
- `taskTitle` → `string`
- `daysUntilDue` → `number`
- `isComplete` → `boolean`

Matches Concept 1's explicit types exactly — inference reads the initial
value the same way an explicit annotation would.
