type Task = {title: string, complete: boolean}

function countCompleteTasks(tasks: Task[]){
  let count = 0;
  for (const task of tasks) {
    inc(task ,count)
  }
  return count
}

function inc (task: Task ,count: number){
  if (task.complete) return count++ 
}

console.log(countCompleteTasks([
  { title: "Buy groceries", complete: true },
  { title: "Walk the dog", complete: false },
  { title: "Pay rent", complete: true },
]))