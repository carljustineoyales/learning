namespace MyFirstApp
{
  class Program
  {
    static void Main(string[] args)
    {
      Console.WriteLine("Hello!");
      Console.Write("Hello!");

      Console.Write("What is your name?");
      string? name = Console.ReadLine();
      Console.WriteLine($"Hello, {name}");

      Console.WriteLine($"Today is {DateTime.Now:dddd, dd MMMM yyyy}.");
    }
  }
}