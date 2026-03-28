# Module 5: Loops — Repeating Actions

---

## for Loop — Over a List

```bash
for item in one two three; do
    echo "${item}"
done
```

Output:
```
one
two
three
```

Structure rules:
- `for` opens the loop
- `in` is followed by the list of items
- `do` starts the block
- `done` closes the block — always required

---

## for Loop — Over Files

```bash
for file in /tmp/*.log; do
    echo "Found: ${file}"
done
```

The `*` glob expands to every matching file. Each filename is assigned to `${file}` one at a time.

Always quote `"${file}"` inside the loop — filenames can contain spaces.

---

## for Loop — Numeric (C-style)

```bash
for (( i=1; i<=5; i++ )); do
    echo "Line ${i}"
done
```

Output:
```
Line 1
Line 2
Line 3
Line 4
Line 5
```

Breakdown:
- `i=1` — starting value
- `i<=5` — keep looping while this is true
- `i++` — increment by 1 each iteration

---

## while Loop

Runs as long as the condition is true:

```bash
count=1

while [[ "${count}" -le 5 ]]; do
    echo "Count: ${count}"
    count=$(( count + 1 ))
done
```

Output:
```
Count: 1
Count: 2
Count: 3
Count: 4
Count: 5
```

---

## until Loop

Runs until the condition becomes true — the opposite of `while`:

```bash
count=1

until [[ "${count}" -gt 5 ]]; do
    echo "Count: ${count}"
    count=$(( count + 1 ))
done
```

Same output as the `while` example above. Use whichever reads more naturally for your situation.

---

## Reading a File Line by Line

This is the correct pattern — do not use `for line in $(cat file)`:

```bash
while IFS= read -r line; do
    echo "${line}"
done < input.txt
```

Why each part matters:

| Part | Why it's needed |
|---|---|
| `IFS=` | Clears the field separator so leading/trailing spaces are preserved |
| `-r` | Prevents backslashes from being interpreted as escape sequences |
| `< input.txt` | Feeds the file into the loop as stdin |

---

## Looping Over Command Output

Same pattern, but using process substitution instead of a file:

```bash
while IFS= read -r line; do
    echo "${line}"
done < <(ls /tmp)
```

`< <(command)` runs the command and feeds its output into the loop line by line.

---

## break and continue

`break` exits the loop immediately:

```bash
for i in 1 2 3 4 5; do
    if [[ "${i}" -eq 3 ]]; then
        break
    fi
    echo "${i}"
done
```

Output:
```
1
2
```

`continue` skips to the next iteration:

```bash
for i in 1 2 3 4 5; do
    if [[ "${i}" -eq 3 ]]; then
        continue
    fi
    echo "${i}"
done
```

Output:
```
1
2
4
5
```

---

## Annotated Example — Log File Summary

Loop over all `.log` files in a directory, count lines in each, and print a summary:

```bash
#!/usr/bin/env bash
# log_summary.sh — counts lines in each log file in a directory

log_dir="${1:-.}"    # use first argument, or current directory if none given

if [[ ! -d "${log_dir}" ]]; then
    echo "Error: not a directory: ${log_dir}" >&2
    exit 1
fi

for file in "${log_dir}"/*.log; do

    # Handle the case where no .log files exist
    if [[ ! -f "${file}" ]]; then
        echo "No .log files found in ${log_dir}"
        exit 0
    fi

    line_count=$(wc -l < "${file}")
    printf "%-40s %d lines\n" "${file}" "${line_count}"
done
```

Run it:

```bash
chmod +x log_summary.sh
./log_summary.sh /var/log
```

Example output:
```
/var/log/syslog                          3847 lines
/var/log/auth.log                         210 lines
/var/log/dpkg.log                        1023 lines
```

**Line by line:**

- `"${1:-.}"` — use `$1` if provided, otherwise default to `.` (current directory). The `:-` syntax sets a default value.
- `"${log_dir}"/*.log` — glob all `.log` files in the directory
- `[[ ! -f "${file}" ]]` — if no `.log` files exist, the glob expands to the literal string `*.log`, which is not a file
- `wc -l < "${file}"` — count lines. The `<` feeds the file directly to `wc` so the filename doesn't appear in the output
- `printf "%-40s %d lines\n"` — `%-40s` left-aligns the filename in a 40-character wide column for tidy output

---

## ⚠️ Common Beginner Traps

**1. Using `for line in $(cat file)` to read a file**

```bash
for line in $(cat file.txt); do    # WRONG — splits on spaces, not lines
    echo "${line}"
done

while IFS= read -r line; do        # correct
    echo "${line}"
done < file.txt
```

If a line contains spaces, `$(cat file)` splits it into multiple items. A line like `hello world` becomes two separate iterations.

**2. Forgetting `IFS=` and `-r` in the while read pattern**

```bash
while read line; do           # risky — strips leading spaces, interprets backslashes
while IFS= read -r line; do  # correct
```

**3. Not quoting `"${file}"` when looping over filenames**

```bash
for file in /tmp/*.log; do
    cat $file       # WRONG — breaks if filename has spaces
    cat "${file}"   # correct
done
```

**4. Glob expanding to a literal string when no files match**

If no `.log` files exist in the directory, `*.log` does not expand to nothing — it stays as the literal string `*.log`. Always check `[[ -f "${file}" ]]` at the start of the loop body.

---

## ✅ Check Questions

1. Why is `for line in $(cat file.txt)` dangerous? What should you use instead?

2. Write a `while` loop that counts down from 10 to 1 and prints `"Blastoff!"` at the end.