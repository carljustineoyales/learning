# Module 4: Conditionals — Making Decisions

---

## The `[[ ]]` Test Construct

Always use double brackets `[[ ]]` for conditions in Bash. Never single `[ ]`.

```bash
if [[ "${name}" == "Alice" ]]; then
    echo "Hello, Alice!"
fi
```

Double brackets are safer and more powerful — they support `&&`, `||`, and regex matching inside them. Single brackets do not.

---

## String Tests

```bash
[[ "${a}" == "${b}" ]]    # equal
[[ "${a}" != "${b}" ]]    # not equal
[[ -z "${a}" ]]           # true if string is empty
[[ -n "${a}" ]]           # true if string is not empty
[[ "${a}" =~ ^[0-9]+$ ]]  # true if string matches regex (numbers only in this example)
```

---

## Numeric Tests

Do not use `==` for numbers — it does string comparison and gives wrong results.

```bash
[[ "${a}" -eq "${b}" ]]    # equal
[[ "${a}" -ne "${b}" ]]    # not equal
[[ "${a}" -lt "${b}" ]]    # less than
[[ "${a}" -le "${b}" ]]    # less than or equal
[[ "${a}" -gt "${b}" ]]    # greater than
[[ "${a}" -ge "${b}" ]]    # greater than or equal
```

---

## File Tests

```bash
[[ -f "${path}" ]]    # is a regular file
[[ -d "${path}" ]]    # is a directory
[[ -e "${path}" ]]    # exists (file or directory)
[[ -r "${path}" ]]    # readable
[[ -w "${path}" ]]    # writable
[[ -x "${path}" ]]    # executable
```

---

## Logical Operators

```bash
[[ "${a}" == "yes" && "${b}" == "yes" ]]    # both must be true
[[ "${a}" == "yes" || "${b}" == "yes" ]]    # at least one must be true
[[ ! -f "${path}" ]]                         # negate — true if file does NOT exist
```

---

## if / elif / else / fi

```bash
#!/usr/bin/env bash

read -p "Enter a number: " num

if [[ "${num}" -gt 100 ]]; then
    echo "Greater than 100"
elif [[ "${num}" -gt 50 ]]; then
    echo "Greater than 50"
elif [[ "${num}" -gt 0 ]]; then
    echo "Positive"
else
    echo "Zero or negative"
fi
```

Structure rules:
- `if` opens the block
- `then` follows the condition (on the same line after `;`, or on the next line)
- `elif` and `else` are optional
- `fi` closes the block — always required

---

## Short-Circuit Pattern

Run a second command only if the first succeeds or fails:

```bash
mkdir -p /tmp/backups && echo "Directory created"     # runs echo only if mkdir succeeded
mkdir -p /tmp/backups || echo "Failed to create dir"  # runs echo only if mkdir failed
```

Useful for one-liners, but avoid chaining too many — it gets hard to read fast.

---

## case Statements

Cleaner than long `if/elif` chains when matching a variable against fixed values:

```bash
#!/usr/bin/env bash

read -p "Enter a day (mon/tue/wed): " day

case "${day}" in
    mon)
        echo "Monday — start of the week"
        ;;
    tue)
        echo "Tuesday"
        ;;
    wed)
        echo "Wednesday — halfway there"
        ;;
    *)
        echo "Unknown day: ${day}"
        ;;
esac
```

- Each pattern ends with `)`
- Each block ends with `;;`
- `*` is the catch-all (like `else`)
- `esac` closes the block (`case` spelled backwards)

You can match multiple patterns in one block:

```bash
case "${day}" in
    sat|sun)
        echo "Weekend!"
        ;;
    *)
        echo "Weekday"
        ;;
esac
```

---

## Annotated Example — File Backup Script With Guards

```bash
#!/usr/bin/env bash
# backup.sh — copies a source directory to a backup destination

source_dir=$1
backup_dir=$2

# Check both arguments were provided
if [[ -z "${source_dir}" || -z "${backup_dir}" ]]; then
    echo "Usage: $0 <source> <destination>" >&2
    exit 1
fi

# Check source directory actually exists
if [[ ! -d "${source_dir}" ]]; then
    echo "Error: source directory does not exist: ${source_dir}" >&2
    exit 1
fi

# Check source directory is readable
if [[ ! -r "${source_dir}" ]]; then
    echo "Error: source directory is not readable: ${source_dir}" >&2
    exit 1
fi

# All checks passed — run the backup
mkdir -p "${backup_dir}"
cp -r "${source_dir}" "${backup_dir}"
echo "Backup complete: ${source_dir} → ${backup_dir}"
```

Run it:

```bash
chmod +x backup.sh
./backup.sh /home/alice/documents /tmp/backups
```

**Line by line:**

- `-z "${source_dir}"` — true if the variable is empty (argument was not passed)
- `||` — if either argument is missing, show usage and exit
- `! -d "${source_dir}"` — true if the path does NOT exist or is not a directory
- `! -r "${source_dir}"` — true if the directory is not readable
- `mkdir -p` — creates the destination directory, including any parent directories, without erroring if it already exists
- `exit 1` — exits with failure code so anything calling this script knows it failed

---

## ⚠️ Common Beginner Traps

**1. Using `[ ]` instead of `[[ ]]`**

```bash
[ $name == "Alice Smith" ]    # WRONG — breaks if name has spaces
[[ "${name}" == "Alice Smith" ]]   # correct
```

**2. Using `==` to compare numbers**

```bash
[[ "10" > "9" ]]     # WRONG — string comparison, "10" < "9" alphabetically
[[ 10 -gt 9 ]]       # correct — numeric comparison
```

**3. Not quoting variables inside conditions**

```bash
[[ ${name} == "Alice" ]]     # risky — breaks if name is empty or has spaces
[[ "${name}" == "Alice" ]]   # correct — always quote
```

**4. Forgetting `fi` or `;;`**

```bash
if [[ "${x}" == "yes" ]]; then
    echo "yes"
# missing fi — Bash will error at the end of the script
```

---

## ✅ Check Questions

1. Write a condition that checks whether a file called `config.txt` exists and is readable.

2. What is the difference between `-eq` and `==` when comparing numbers?