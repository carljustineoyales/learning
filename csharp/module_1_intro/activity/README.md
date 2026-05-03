# Module 1 Activity — Greeter

Create a new console project called `Greeter`:

```bash
dotnet new console -n Greeter
cd Greeter
```

Open `Program.cs` and **delete everything** in it — by default .NET generates
top-level statements. Replace it with the classic structure below as your starting
point, then build your program inside `Main`:

```csharp
namespace Greeter
{
    class Program
    {
        static void Main(string[] args)
        {
            // your code goes here
        }
    }
}
```

Your program must:

1. Ask the user for their **name** using `Console.Write()` for the prompt and
   `Console.ReadLine()` for the input
2. Ask the user for their **hometown** using a second `Console.ReadLine()` call
3. Print a greeting using **string interpolation** that includes both their name
   and their hometown — for example:
   `Hello, Alice! You are from London.`
4. Print the **current day of the week** on a second line using `DateTime.Now`
   with a format specifier — for example:
   `Today is Wednesday.`
5. Include at least one `//` single-line comment

```bash
# Run your program with:
dotnet run
```

Paste your completed `Program.cs` here when you are done.
Your submission will be reviewed, corrected if needed, and scored out of 10.
You need **7/10 or above** to move on to Module 2.