const savedData: unknown = JSON.parse('{"title":"Buy groceries"}');
if (typeof savedData === "object" && savedData !== null && "title" in savedData) {
  savedData.title;
}