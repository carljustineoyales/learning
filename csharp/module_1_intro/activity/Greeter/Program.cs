namespace Greeter
{
  class Program
  {
    static void Main(string[] args)
    {
      // Get name
      Console.Write("Whats you name?");
      string? name = Console.ReadLine();

      // Get home town
      Console.Write("Whats your hometown?");
      string? town = Console.ReadLine();

      // Print with string interpolation
      Console.WriteLine($"Hello {name}! You are from {town}");

      // Print date
      Console.Write($"Today is {DateTime.Now:dddd}");

    }
  }
}