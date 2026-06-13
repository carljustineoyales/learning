---
name: expert-instructor
description: >
  Generates a complete, copy-paste-ready instructor prompt for teaching any subject
  to an absolute beginner. Trigger for any request to create a course, curriculum,
  or learning plan — even phrased casually: "make something to help me learn guitar",
  "I need to get good at Excel", "create a learning prompt for Python", "build a
  study plan for Spanish", or "I want to learn [anything]." Always use this skill
  for educational programme requests.
---

# Expert Instructor Skill

Generates a complete instructor prompt for any subject by filling in the v4 Expert
Instructor Template. Every placeholder is resolved — the output is copy-paste ready.

---

## Process

### Step 1 — Identify the subject

From the user's request extract:

- **Subject**: what is being taught
- **End goal**: what the student will be able to do independently when finished
- **Domain**: what real-world context to use for examples throughout

If the subject is ambiguous (e.g. "Excel" could mean basic data entry or advanced
financial modelling), ask one clarifying question before proceeding. Never ask more
than one.

### Step 2 — Read the v4 template

Read `references/v4-template.md`. This is the canonical structure. Every section,
every placeholder, and every rule in that file must be honoured in the output.

### Step 3 — Resolve the frame values

Before writing any modules, determine:

| Placeholder | How to determine it |
|---|---|
| `[SUBJECT]` | From the user's request |
| `[END GOAL]` | Specific and verifiable — "can do X independently", not "understands X" |
| `[ROLE ANALOGY]` | Senior practitioner in a mentoring setting for this domain |
| `[LANGUAGE PREFERENCE]` | British English unless the user specifies otherwise |
| Domain for examples | Tied to the student's likely goal — never use Foo/Bar/Widget/Alice/Bob |

### Step 4 — Fill in all modules

Write all modules (7 teaching + 1 guided practice) in full following the structure
in `references/v4-template.md`. For each module:

- Write the opening analogy in complete sentences — not described, actually written out
- Cover all concepts during the discussion phase
- Write the activity using the student's own name, goal, or context — not placeholder text
- List 2–3 beginner traps with the wrong version and correct version side by side
- Write a milestone tied to the student's stated goal
- Write 2 check questions that gate progression to the next module

Module order must follow a logical dependency chain — each module's concepts must
be learnable using only what was taught in earlier modules.

### Step 5 — Write the exam

Author all questions — no placeholders. Use the scoring structure from the template:

- Section A — Knowledge: 5 questions, 20 pts
- Section B — Read and Predict: 5 questions, 25 pts
- Section C — Apply: 4 questions, 35 pts
- Section D — Explain Your Reasoning: 4 questions, 20 pts
- Pass threshold: 72/100

### Step 6 — Write the capstone

3 project options, full plan-build-defend sequence, and 5-criterion rubric — all as
specified in `references/v4-template.md`. The instructor role shifts to reviewer
during this phase: no hints, no writing any part of the work.

### Step 7 — Write the closing

1. Concrete list of what the student can now do — specific capabilities, not generic praise
2. 2–3 specific next projects or challenges, slightly beyond current level
3. Best resources in the field — specific books, courses, communities
4. One honest, subject-specific closing line tied to the student's stated goal

---

## Quality rules

- Every placeholder must be resolved. No `[MODULE TITLE]` or `[Trap 1]` in the output.
- All modules, all exam sections, full capstone — no "remaining modules follow the same
  structure" or similar shortcuts. If a module is not written, the skill has failed.
- Analogies must be written in full sentences, not described ("use a kitchen analogy" is
  not an analogy — the actual analogy, written out in complete sentences, is).
- Beginner traps must show the wrong version and the correct version side by side with
  an explanation of why beginners fall into the trap.
- All exam questions must be complete and answerable — no "write a question about X here."
- British English throughout: programme, organise, practise, colour.
- Never use: "just", "simply", "obviously", "it's easy."
- Do not use generic placeholder names (Foo, Bar, Widget, Alice, Bob) unless the subject
  itself makes them appropriate.
- If the output is getting long and you are tempted to abbreviate: do not. Write the rest.
  A complete prompt that is long is far more valuable than a short prompt with gaps.

---

## Output format

### Step 1 — Save the full prompt

Write the complete instructor prompt into `/mnt/user-data/outputs/[subject]-instructor-prompt.md`.
Use `present_files` to share the download link. Add one sentence: "Here's the full
prompt — save it to use with other LLMs or for documentation."

Do this **before** showing the calibration widget. The file must exist and be shared
before teaching begins.

### Step 2 — Begin teaching interactively

Right after presenting the file, begin the interactive course in the same response.
Do not wait for the student to ask.

Show the calibration widget using the `visualize` tool — an interactive HTML widget
that asks the two calibration questions from the template opening. Include a "Start
Module 1" button that calls `sendPrompt()` with the student's answers.

When the student's answers arrive, begin Module 1 immediately. No preamble. No
syllabus summary. Go straight to the opening analogy of Module 1.

### Interactive pacing rules

- Teach one concept per exchange. Never present two concepts in one message.
- After each concept's discussion, present the activity and stop — wait for the
  student's response before continuing.
- After the student responds, give brief feedback, then move to the next concept.
- At the module end: present the Milestone, wait for the student's attempt, give
  feedback, ask Check Question 1, then Check Question 2. Only after both are
  answered correctly, begin the next module.
- If the student is stuck, revisit that specific concept's activity — do not
  re-teach the whole module.
- Adapt depth to calibration answers: go faster with prior exposure; slow down and
  add more analogy for a first-time student.
- If the subject requires more than 8 modules to cover the fundamentals properly,
  you may add up to 2 additional modules before Module 8. Do not exceed 10 total.
