# Module 1: What Is a Shell Script and How Does It Run?

---

## What Is Bash?

Your terminal runs a programme called a **shell** — it reads commands you type and executes them.  
On Ubuntu, the default shell is **Bash** (Bourne Again SHell).

A **shell script** is just a plain text file containing a list of those same commands.  
Instead of typing them one by one, you write them in a file and run the whole file at once.

No compiler. No special software. Just a text file.

---

## Step-by-Step: Your First Script

### Step 1 — Create the file

```bash
touch hello.sh
```

This creates an empty file called `hello.sh`.  
The `.sh` extension is just convention — Bash doesn't require it, but it tells humans (and editors) what the file is.

---

### Step 2 — Open it in a text editor

```bash
nano hello.sh
```

`nano` is a simple terminal editor built into Ubuntu. Type this exactly:

```bash
#!/usr/bin/env bash
# My first script
echo "Hello, $(whoami)!"
echo "Today is $(date '+%A, %d %B %Y')"
echo "You are in: $(pwd)"
```

Save with `Ctrl+O`, then Enter. Exit with `Ctrl+X`.

---

### Step 3 — Make it executable

```bash
chmod +x hello.sh
```

By default, new files aren't allowed to run as programmes.  
`chmod +x` grants execute permission.

---

### Step 4 — Run it

```bash
./hello.sh
```

Expected output:

```
Hello, alice!
Today is Friday, 27 March 2026
You are in: /home/alice
```

---

## What Every Line Does

| Line | What it does |
|---|---|
| `#!/usr/bin/env bash` | The **shebang** — tells the OS which programme to use to run this file. Must be line 1, no exceptions. |
| `# My first script` | A **comment** — ignored by Bash entirely. Write them generously. |
| `echo "Hello, $(whoami)!"` | `echo` prints text. `$(whoami)` runs the `whoami` command and inserts its output into the string. |
| `echo "Today is $(date '+%A, %d %B %Y')"` | `$(date ...)` runs `date` with a quoted format string and inserts the result. |
| `echo "You are in: $(pwd)"` | `pwd` prints your current working directory. |

---

## Command Substitution — `$(...)`

The `$(...)` syntax is called **command substitution**.  
It runs a command and uses its output as a value right where you wrote it.

```bash
echo "Logged in as: $(whoami)"
echo "Kernel version: $(uname -r)"
echo "Uptime: $(uptime -p)"
```

You will use this constantly. Get comfortable with it now.

---

## The Shebang Line

```bash
#!/usr/bin/env bash
```

- `#!` — signals to the OS that this is a script and what follows is the interpreter path
- `/usr/bin/env bash` — finds `bash` wherever it is installed on the system
- Must be the **very first line** — not even a blank line above it

Why `#!/usr/bin/env bash` instead of `#!/bin/bash`?  
On some systems Bash is not at `/bin/bash`. Using `env bash` finds it automatically — more portable.

---

## Comments

```bash
# This is a comment — Bash ignores everything after #
echo "This runs"   # This part is also a comment
```

Use comments to explain *why* you are doing something, not just what.  
Scripts you write today will confuse you in three months without them.

---

## `./hello.sh` vs `bash hello.sh`

| Command | What happens |
|---|---|
| `./hello.sh` | Uses the shebang to decide how to run it. Requires `chmod +x`. **Use this.** |
| `bash hello.sh` | Bypasses the shebang and explicitly calls Bash. Works without `chmod +x`. |

Use `./hello.sh` from the start and build the right habit.

---

## How a Script Actually Runs

When you run `./hello.sh`:

1. The OS reads the shebang and launches `/usr/bin/env bash`
2. Bash spawns a **new child process** — a fresh shell separate from your terminal
3. That child shell runs your commands top to bottom
4. When it reaches the end (or hits `exit`), the child process exits
5. Control returns to your terminal

This is why variables you set inside a script do not appear in your terminal afterwards — they lived in a separate child process that no longer exists.

---

## Common Beginner Traps

**1. Forgetting `chmod +x`**

```
bash: ./hello.sh: Permission denied
```

Fix:

```bash
chmod +x hello.sh
```

---

**2. Shebang not on line 1**

The shebang must be the absolute first line. A blank line above it breaks it.

```bash
                     # WRONG — blank line above shebang
#!/usr/bin/env bash
```

```bash
#!/usr/bin/env bash  # correct — line 1, nothing above it
```

---

**3. Windows line endings (if you ever copy a script from a Windows machine)**

Windows adds invisible `\r` characters to line endings, causing errors like:

```
/usr/bin/env: 'bash\r': No such file or directory
```

Fix with:

```bash
dos2unix hello.sh
```

---

**4. Running `bash script.sh` as a habit**

It works, but it bypasses the shebang. When shebangs matter more (e.g. Python scripts, other interpreters), this habit will cause confusing failures. Use `./script.sh`.

---

## Check Questions

1. What does the shebang line do, and where must it appear in the file?
2. What is the difference between `./hello.sh` and `bash hello.sh`?