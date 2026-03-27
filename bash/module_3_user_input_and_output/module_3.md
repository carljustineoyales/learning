# Module 3: User Input and Output

---

## echo — Basic Output

```bash
echo "Hello, world"
echo "My name is ${name}"
```

The `-e` flag enables escape sequences:

```bash
echo -e "Line one\nLine two"    # \n = newline
echo -e "Column1\tColumn2"      # \t = tab
```

Output:
```
Line one
Line two
Column1	Column2
```

---

## printf — Precise Output

`printf` gives you more control than `echo`. Preferred when formatting matters.

```bash
printf "Name: %s\n" "Alice"
printf "Age:  %d\n" 25
printf "Pi:   %.2f\n" 3.14159
```

Output:
```
Name: Alice
Age:  25
Pi:   3.14
```

| Format | Meaning |
|---|---|
| `%s` | String |
| `%d` | Integer |
| `%f` | Float |
| `%.2f` | Float rounded to 2 decimal places |
| `\n` | Newline |
| `\t` | Tab |

---

## read — Getting Input From the User

```bash
read -p "Enter your name: " name
echo "Hello, ${name}!"
```

Useful flags:

```bash
read -p "Enter your name: " name        # -p shows a prompt inline
read -s -p "Enter password: " pass      # -s hides input (silent — for passwords)
read -t 10 -p "Enter value: " value     # -t times out after 10 seconds
```

Full example:

```bash
#!/usr/bin/env bash

read -p "What is your name? " name
read -p "How old are you? " age

echo "Hello, ${name}! You are ${age} years old."
echo "In 5 years you will be $(( age + 5 ))."
```

---

## Standard Streams

Every programme in Linux has three streams — channels for data to flow in and out:

| Stream | Number | What it is |
|---|---|---|
| `stdin` | 0 | Input coming in (keyboard by default) |
| `stdout` | 1 | Normal output (terminal by default) |
| `stderr` | 2 | Error output (terminal by default) |

This matters because you can redirect each one independently.

---

## Redirection

Send output to a file instead of the terminal:

```bash
echo "Hello" > output.txt      # overwrite — creates or replaces the file
echo "Hello" >> output.txt     # append — adds to the end of the file
```

Redirect errors separately:

```bash
ls /fake/path 2> errors.txt         # send stderr to a file
ls /fake/path 2>/dev/null           # discard errors entirely
ls /fake/path > out.txt 2>&1        # send both stdout and stderr to the same file
```

`/dev/null` is a black hole — anything sent to it disappears.

### Order matters with `2>&1`

```bash
command > file 2>&1     # correct — stdout goes to file, then stderr joins stdout
command 2>&1 > file     # WRONG — stderr goes to terminal, stdout goes to file
```

Always write `> file` before `2>&1`.

---

## Pipes

Send the output of one command directly into another:

```bash
ls | wc -l                        # count files in current directory
cat /etc/passwd | grep "alice"    # find a user
ps aux | grep "firefox"           # find a running process
```

The `|` takes stdout from the left command and feeds it as stdin to the right command.

You can chain as many as you need:

```bash
cat access.log | grep "ERROR" | sort | uniq -c | sort -rn
```

---

## Here Documents (Heredoc)

A heredoc lets you pass a block of multi-line text to a command:

```bash
cat <<EOF
This is line one
This is line two
Hello, ${USER}
EOF
```

Everything between `<<EOF` and `EOF` is sent as input. Variables are expanded.
Use `<<'EOF'` (with quotes) to treat it as a literal — no variable expansion.

Useful for writing multi-line config files in scripts:

```bash
cat <<EOF > /tmp/config.txt
host=localhost
port=8080
user=${USER}
EOF
```

---

## Terminal Colours

Use ANSI colour codes to make output easier to read:

```bash
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'    # No colour — resets back to normal

echo -e "${GREEN}Success!${NC}"
echo -e "${RED}Error: something went wrong.${NC}"
echo -e "${YELLOW}Warning: proceed with caution.${NC}"
```

Always end with `${NC}` — without it, the colour bleeds into everything after it.

---

## A Reusable Logging Pattern

Put this near the top of any script to get consistent, readable log output:

```bash
log_info()  { echo "[INFO]  $*"; }
log_warn()  { echo "[WARN]  $*" >&2; }
log_error() { echo "[ERROR] $*" >&2; }
```

Usage:

```bash
log_info  "Starting backup..."
log_warn  "Destination is almost full"
log_error "Source directory not found"
```

Output:
```
[INFO]  Starting backup...
[WARN]  Destination is almost full
[ERROR] Source directory not found
```

Notice that `log_warn` and `log_error` use `>&2` — they write to stderr, not stdout.
This is correct behaviour: errors and warnings belong on stderr so they can be separated from normal output.

`$*` means "all arguments passed to the function" — covered fully in Module 6.

---

## Putting It Together — An Interactive Script

```bash
#!/usr/bin/env bash
# input_demo.sh — demonstrates input, output, and redirection

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

log_info()  { echo "[INFO]  $*"; }
log_error() { echo "[ERROR] $*" >&2; }

read -p "Enter a directory to inspect: " target_dir

if [[ ! -d "${target_dir}" ]]; then
    log_error "Directory does not exist: ${target_dir}"
    exit 1
fi

file_count=$(ls "${target_dir}" | wc -l)

log_info "Directory: ${target_dir}"
log_info "Contains ${file_count} items"
echo -e "${GREEN}Done.${NC}"
```

---

## ⚠️ Common Beginner Traps

**1. Sending error messages to stdout**

```bash
echo "Error: file not found"        # WRONG — goes to stdout
echo "Error: file not found" >&2    # correct — goes to stderr
```

**2. Wrong order with `2>&1`**

```bash
command > file 2>&1     # correct
command 2>&1 > file     # WRONG — stderr still goes to terminal
```

**3. Forgetting `${NC}` after a colour**

```bash
echo -e "${RED}Error!"           # everything after this is also red
echo -e "${RED}Error!${NC}"      # correct — colour resets after the message
```

**4. Using `>` when you meant `>>`**

```bash
echo "log entry" > logfile.txt     # overwrites — destroys everything already in the file
echo "log entry" >> logfile.txt    # appends — safe
```

---

## ✅ Check Questions

1. Write a `read` command that prompts `"Enter your age: "`, stores the result in a variable called `age`, and times out after 15 seconds.

2. What does `2>/dev/null` do, and when would you use it?
