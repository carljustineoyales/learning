# Concept 3 — Arrays and Tuples

## Discussion
`string[]` types an array where every element must be a string. A tuple,
`[number, number]`, fixes both the *length* and the type at *each
position* — useful for a fixed pair like `[hours, minutes]` for a reminder
time, which an ordinary array type can't express as precisely.

## Activity
```ts
const taskTitles: string[] = ["Buy groceries", "Walk the dog"];
const reminderTime: [number, number] = [9, 30];
```
Push a number into `taskTitles`; assign a three-element array to
`reminderTime`.

**Expected result:** two distinct errors — the array error complains about
element type, the tuple error complains about length or position.

## Result
```
tasks.ts:2:7 - error TS2322: Type '[number, number, number]' is not assignable to type '[number, number]'.
  Source has 3 element(s) but target allows only 2.
2 const reminderTime: [number, number] = [9, 30,0];
        ~~~~~~~~~~~~
tasks.ts:4:17 - error TS2345: Argument of type 'number' is not assignable to parameter of type 'string'.
4 taskTitles.push(5)
                  ~
Found 2 errors in the same file, starting at: tasks.ts:2
```

Both errors present and correct — tuple length mismatch (`TS2322`) and
array element type mismatch (`TS2345`), confirming they enforce different
things.

## Notes
- Wrote the invalid tuple directly at declaration (`[9, 30, 0]`) rather
  than reassigning a separate `let` — sidesteps the `const` reassignment
  trap from Concept 1 entirely, valid alternative approach for this
  activity.
