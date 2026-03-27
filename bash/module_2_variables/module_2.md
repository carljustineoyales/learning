# Module 2: Variables and Data

---

## Declaring Variables

```bash
name="Alice"
age=30
```

**No spaces around `=`.** This is the single most common beginner mistake in Bash.

```bash
name = "Alice"   # WRONG — Bash tries to run a command called "name"
```

---

## Reading Variables

```bash
echo $name        # works
echo ${name}      # better — use braces for clarity
echo "${name}"    # best — always quote your variables
```

Always quote variables when using them. Without quotes, Bash splits on spaces and breaks with filenames like `my file.txt`.

---

## Naming Conventions

| Style | Use for |
|---|---|
| `lowercase` | Local variables inside scripts |
| `UPPER_CASE` | Constants and environment variables |

---

## Command Substitution

Run a command and store its output in a variable:

```bash
current_date=$(date +%Y-%m-%d)
file_count=$(ls | wc -l)

echo "Today is: ${current_date}"
echo "Files here: ${file_count}"
```

The `$(...)` syntax runs the command inside and replaces itself with the output.

---

## Arithmetic

```bash
x=10
y=3

sum=$(( x + y ))       # 13
product=$(( x * y ))   # 30
remainder=$(( x % y )) # 1

echo "Sum: ${sum}"
```

`$(( ))` is the only safe way to do integer maths in Bash.  
**It does NOT work for decimals.** Use `bc` or `awk` for floating point.

```bash
# Decimal example with bc
result=$(echo "scale=2; 10 / 3" | bc)
echo "${result}"   # 3.33
```

---

## Single Quotes vs Double Quotes

```bash
name="Alice"

echo "Hello, ${name}"   # → Hello, Alice    (expansion happens)
echo 'Hello, ${name}'   # → Hello, ${name}  (no expansion — literal)
```

- **Double quotes** `"..."` — variables and `$()` are expanded
- **Single quotes** `'...'` — everything is treated as a literal string

---

## Special Variables

| Variable | What it holds |
|---|---|
| `$0` | The name of the script itself |
| `$1`, `$2`, ... | Arguments passed to the script |
| `$#` | Number of arguments passed |
| `$@` | All arguments as separate words |
| `$?` | Exit code of the last command (0 = success) |
| `$$` | Process ID of the current script |
| `$USER` | Current username |
| `$HOME` | Your home directory |
| `$PWD` | Current working directory |

---

## Annotated Example — A Script That Uses Arguments

```bash
#!/usr/bin/env bash
# greet.sh — takes a name and age as arguments

name=$1    # first argument
age=$2     # second argument

# Check that name was provided
if [[ -z "${name}" ]]; then
    echo "Usage: $0 <name> <age>"
    exit 1
fi

echo "Hello, ${name}! You are ${age} years old."
echo "In 10 years you will be $(( age + 10 ))."
```

Run it:

```bash
chmod +x greet.sh
./greet.sh Alice 25
```

Output:

```
Hello, Alice! You are 25 years old.
In 10 years you will be 35.
```

**Line by line:**

- `name=$1` — store the first argument in a variable
- `[[ -z "${name}" ]]` — `-z` means "is this string empty?" — covered fully in Module 4
- `exit 1` — exit with code 1, meaning failure
- `$(( age + 10 ))` — arithmetic directly inside the echo

---

## set -u — Catch Unset Variables

By default, Bash silently treats an unset variable as an empty string.  
This causes bugs that are very hard to find.

Add this near the top of your scripts:

```bash
set -u
```

Now Bash will error and stop if you accidentally use a variable you never set.

```bash
set -u
echo "${undefined_var}"   # Error: undefined_var: unbound variable
```

We'll cover the full set of safety flags in Module 7.

---

## ⚠️ Common Beginner Traps

**1. Space around `=`**

```bash
greeting = "Hello"   # WRONG — runs '=' as a command
greeting="Hello"     # correct
```

**2. Unquoted variables with spaces**

```bash
filename="my document.txt"
rm $filename     # WRONG — Bash splits this into: rm my document.txt (two args)
rm "$filename"   # correct
```

**3. Floating point with `$(( ))`**

```bash
result=$(( 10 / 3 ))   # gives 3, not 3.333
```

Use `bc` for decimals.

**4. Forgetting `$` when reading a variable**

```bash
name="Alice"
echo name       # prints: name
echo $name      # prints: Alice
echo "${name}"  # prints: Alice (best)
```

---

## ✅ Check Questions

Answer these before moving to Module 3:

1. What is wrong with this line?
   ```bash
   greeting = "Hello, world"
   ```

2. Write a one-liner that stores the number of files in the current directory in a variable called `count`.  
   *(Hint: `ls | wc -l` counts lines of output)*
