# Concept 5 — Type Aliases for Primitives

## Discussion
`type TaskId = number` creates a named alias — it changes nothing at
runtime, but documents intent and makes function signatures easier to read
at a glance.

## Activity
```ts
type TaskId = number;
type CategoryId = number;

function moveTaskToCategory(task: TaskId, category: CategoryId) {}

moveTaskToCategory(/* category id here */, /* task id here */);
```
Call with the arguments swapped (category ID where task ID belongs, and
vice versa).

**Expected result:** no error — both aliases resolve to the same
underlying `number`, so TypeScript permits the swap despite it being
semantically wrong.

## Result
Confirmed — no error, no output. Demonstrates that type aliases document
intent but don't enforce it; TypeScript's checking is structural, not
nominal.

## Terminology clarification (raised mid-session)
Confusion arose over whether `type X = {...}` was a distinct "type alias
category" separate from an "object type." Clarified:
- An **object type** is the shape itself: `{ id: number; title: string }`.
- A **type alias** is just a name given to any type — primitive, array,
  tuple, or object — e.g. `type Task = { id: number; title: string }`.
- `Task` in that example is not a new kind of type; it's an alias pointing
  at an object type.
- Object types can nest other object types as fields
  (`type Task = { details: { title: string } }`), but nesting wasn't
  taught in this module — Concept 5 covered aliases for **primitives**
  only. Nesting belongs closer to Module 3 (interfaces/composition) and
  was flagged as a pull-forward when it came up, not built into the
  milestone.
