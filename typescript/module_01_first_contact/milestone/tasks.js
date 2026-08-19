"use strict";
function countCompleteTasks(tasks) {
    let count = 0;
    for (const task of tasks) {
        inc(task, count);
    }
    return count;
}
function inc(task, count) {
    if (task.complete)
        return count++;
}
console.log(countCompleteTasks([
    { title: "Buy groceries", complete: true },
    { title: "Walk the dog", complete: false },
    { title: "Pay rent", complete: true },
]));
