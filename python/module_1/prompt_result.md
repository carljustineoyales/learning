That's a brilliant starting point! JavaScript and HTML experience means you already understand the fundamentals — variables, logic, the idea that code runs in sequence. Python is going to feel refreshingly clean compared to JS.

And "everything" is a great ambition. We'll make sure the examples stay varied — a bit of automation, data, web, and games as we go.

---

# Module 1: Python Basics & Setup

## What is Python and why bother?

You already know JavaScript runs in the browser. Python runs on your machine (or a server). It's used for:

- **Web backends** (Instagram, Pinterest, Spotify all use Python)
- **Data science & AI** (the dominant language in that world)
- **Automation** (scripting, file handling, web scraping)
- **Games** (Pygame), **APIs**, **CLIs** — basically everything

The biggest difference you'll notice coming from JS: Python is designed to *read like English*. No curly braces, no semicolons.

---

## Installing Python

1. Go to **python.org/downloads**
2. Download the latest version (3.12+)
3. On Windows: tick **"Add Python to PATH"** during install — easy to miss
4. Verify it worked by opening a terminal and typing:

```bash
python --version
```

You should see something like `Python 3.12.0`.

---

## Two ways to run Python

**1. The REPL** (Read-Eval-Print Loop) — like your browser console

```bash
python
```

You get a `>>>` prompt. Type code, hit Enter, see the result instantly. Great for experimenting.

**2. A `.py` file** — for real programs

Create a file called `hello.py`, write your code, then run it:

```bash
python hello.py
```

You'll mostly use `.py` files. Think of the REPL as a scratchpad.

---

## Your first line of Python

Coming from JS, you wrote:

```javascript
console.log("Hello, world!")
```

In Python:

```python
print("Hello, world!")
```

Cleaner. No `console.`, just `print()`.

---

## Comments

Same idea as JS, but only one style:

```python
# This is a comment — Python ignores it
print("This runs")  # You can comment at end of a line too
```

No `/* */` block comments in Python (there's a workaround with triple quotes, but don't worry about that yet).

---

## Variables

In JS you wrote `let name = "Alice"` or `const age = 30`. In Python, no keyword needed:

```python
name = "Alice"
age = 30
print(name)
print(age)
```

Python uses **snake_case** for variable names (underscores, all lowercase):

```python
first_name = "Alice"    # ✅ Python style
firstName = "Alice"     # ❌ That's camelCase — works, but not Pythonic
```

Variables can be reassigned freely:

```python
score = 0
score = 10   # Totally fine
score = "ten"  # Also fine — Python doesn't lock the type
```

---

## Basic Data Types

You know these from JS. Python's equivalents:

| Type | Example | JS equivalent |
|------|---------|---------------|
| `int` | `42` | `number` |
| `float` | `3.14` | `number` |
| `str` | `"hello"` | `string` |
| `bool` | `True` / `False` | `true` / `false` |

Note: Python booleans are capitalised — `True` and `False`, not `true` and `false`. This catches JS developers regularly.

```python
age = 25          # int
height = 1.82     # float
name = "Alice"    # str
is_logged_in = True  # bool
```

---

## Checking and Converting Types

```python
x = "42"
print(type(x))        # <class 'str'>

y = int(x)            # Convert string to int
print(type(y))        # <class 'int'>
print(y + 8)          # 50

z = str(100)          # Convert int to string
print(z + " points")  # "100 points"
```

---

## Three Traps for JS Developers

**1. Python is case-sensitive**
```python
name = "Alice"
print(Name)  # ❌ NameError — Name and name are different
```

**2. `=` assigns, `==` compares** — same as JS, but worth repeating
```python
age = 25        # assignment
age == 25       # comparison (returns True)
```

**3. `print` needs parentheses — always**
```python
print "hello"   # ❌ Syntax error (this was Python 2)
print("hello")  # ✅
```

---

## Check-in Questions

Before we move to Module 2, have a go at these:

**Q1.** What is the difference between a variable and a value?

**Q2.** Write a line of code that stores your name in a variable and prints a greeting — something like `Hello, Alice!`

Take your time. You can write the code out and paste it here, or just explain your thinking. Either works!