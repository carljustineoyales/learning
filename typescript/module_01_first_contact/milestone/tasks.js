"use strict";
function countCompleteTasks(tasks) {
    let count = 0;
    for (const task of tasks) {
        if (task.complete)
            count++;
    }
    return count;
}
console.log(countCompleteTasks([
    { title: "Buy groceries", complete: true },
    { title: "Walk the dog", complete: false },
    { title: "Pay rent", complete: true },
]));
