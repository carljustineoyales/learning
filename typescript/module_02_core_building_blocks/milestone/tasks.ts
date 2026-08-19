type Task = {
  id: number,
  title: string,
  subTasks: string[]
  categoryIds: [number,number],
  complete: boolean,
  date: [number,string,number]
}

const task: Task = {
  id: 1,
  title: "This is a title",
  subTasks: ["title2", "title3"],
  categoryIds:[1,2],
  complete:false,
  date: [2026, "November", 28]
}