# Module 1: How C# Works — The .NET Platform

## The big picture

C# is the language. .NET is the platform it runs on. Think of it like this: C# is
the language you write recipes in, and .NET is the kitchen that actually cooks them.
You need both.

.NET runs on Windows, macOS, and **Linux (including Ubuntu)** — which matters for
APIs because your server will almost certainly run Linux. Always use **modern .NET**
(version 6 or higher) for new projects. You may see references to ".NET Framework"
in older tutorials — that's the legacy, Windows-only predecessor. Ignore it for
new work.

---

## How your code becomes a running program

When you write C#, the compiler converts it to **Intermediate Language (IL)** — not
machine code yet, but a halfway form. When you run the program, the .NET runtime
(called the CLR) converts that IL to actual machine instructions on the fly.

The important practical consequence: **type errors are caught at compile time**,
before your program ever runs. If you put a number where text is expected, the
compiler refuses to build. This is especially valuable in an API where bad data
arrives constantly.

---

## Setting up on Ubuntu

```bash
# Install the .NET SDK (Ubuntu 22.04 / 24.04)
sudo apt-get update
sudo apt-get install -y dotnet-sdk-8.0

# Verify the install
dotnet --version
# Expected output: 8.0.x
```

For an editor, install **VS Code** and add the **C# Dev Kit** extension.

---

## Creating and running your first project

```bash
dotnet new console -n MyFirstApp
cd MyFirstApp
dotnet run
```

- `dotnet new console` creates a console application
- `dotnet run` builds and runs it
- You **must be inside the folder containing the `.csproj` file** — not a parent
  folder, not a subfolder

---

## The classic program structure

This is the full, explicit structure that C# has used since its beginning. Every
piece of it has a purpose — nothing is hidden from you.

```csharp
namespace MyFirstApp          // a namespace groups related code together
{
    class Program             // a class is a container for code
    {
        static void Main(string[] args)   // Main is where the program starts
        {
            Console.WriteLine("Hello, world!");
        }
    }
}
```

**Breaking it down line by line:**

- `namespace MyFirstApp` — namespaces are like folders for your code. They prevent
  naming conflicts when your project grows or you use external libraries. In ASP.NET
  Core you will see namespaces everywhere — `Microsoft.AspNetCore.Mvc`, for example.
- `class Program` — in C#, all code lives inside a class. A class is a blueprint.
  `Program` is just the conventional name for the entry-point class.
- `static void Main(string[] args)` — this is the **entry point**: the method the
  runtime calls when your program starts. Every C# console application must have one.
  - `static` means it belongs to the class itself, not an instance of it
  - `void` means it returns nothing
  - `string[] args` holds any command-line arguments passed to the program
- `Console.WriteLine()` — writes a line of text to the terminal

You will write this structure throughout the course. You need to know what every
part means, not just copy it.

---

## Console output and input

```csharp
namespace MyFirstApp
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello!");  // prints text, then moves to a new line
            Console.Write("Hello!");      // prints text, stays on the same line

            Console.Write("What is your name? ");
            string? name = Console.ReadLine();  // waits for the user to type and press Enter
            Console.WriteLine($"Hello, {name}!");
        }
    }
}
```

---

## String interpolation

The `$` prefix turns a string into an **interpolated string** — anything inside
`{ }` is evaluated as code, not printed as literal text.

```csharp
string? name = Console.ReadLine();
Console.WriteLine($"Hello, {name}!");
// Output: Hello, Alice!
```

You can include format specifiers inside the braces:

```csharp
Console.WriteLine($"Today is {DateTime.Now:dddd, dd MMMM yyyy}.");
// Output: Today is Saturday, 03 May 2025.
```

---

## Comments

```csharp
// Single-line comment — ignored by the compiler

/* Multi-line
   comment */

/// <summary>
/// XML documentation comment — tools use these to generate docs.
/// Write these above public methods and classes.
/// </summary>
```

---

## Full annotated example

```csharp
namespace Greeter
{
    class Program
    {
        static void Main(string[] args)
        {
            // Ask for the user's name — Write() keeps the cursor on the same line
            Console.Write("Enter your name: ");

            // ReadLine() returns string? — a string that might be null if input fails
            string? name = Console.ReadLine();

            // $ makes this an interpolated string — {name} is replaced with the actual value
            Console.WriteLine($"Hello, {name}!");

            // DateTime.Now gives the current date and time
            // :dddd, dd MMMM yyyy controls how the date is displayed
            Console.WriteLine($"Today is {DateTime.Now:dddd, dd MMMM yyyy}.");
        }
    }
}
```

**Why `string?` and not just `string`?**
`Console.ReadLine()` can return `null` if the input stream runs out of data. The
`?` tells C# this variable is allowed to be null. Without it, the compiler warns
you. You will learn to handle null properly in Module 2 — for now, always use
`string?` for anything from `ReadLine()`.

---

## Common beginner traps

**Running `dotnet run` from the wrong folder**
```bash
# Wrong — you are in the parent folder
~/projects $ dotnet run

# Correct — cd into the project folder first
~/projects $ cd MyFirstApp
~/projects/MyFirstApp $ dotnet run
```

**Forgetting the `$` on an interpolated string**
```csharp
// Wrong — prints literally: Hello, {name}!
Console.WriteLine("Hello, {name}!");

// Correct — prints: Hello, Alice!
Console.WriteLine($"Hello, {name}!");
```

**Using `+` to build strings**
```csharp
// Works, but verbose and error-prone:
Console.WriteLine("Hello, " + name + "! Today is " + DateTime.Now + ".");

// Prefer this — cleaner and the standard in modern C# and ASP.NET Core:
Console.WriteLine($"Hello, {name}! Today is {DateTime.Now:dddd, dd MMMM yyyy}.");
```