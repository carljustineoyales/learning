# expert-instructor

A Claude skill that generates complete instructor prompts for teaching any subject
to an absolute beginner, then immediately begins teaching interactively.

---

## What it does

Give it a subject — Python, Excel, Spanish, guitar, watercolour painting,
anything — and it does two things in the same response:

1. **Saves a complete instructor prompt** as a downloadable `.md` file you can
   use with any other LLM or keep for documentation. Every section is fully
   authored — no placeholders left to fill in.

2. **Immediately begins teaching interactively** — a calibration widget asks
   two questions (prior experience, goal), then the course begins live: one
   concept at a time, waiting for your response before proceeding.

Both the saved prompt and the live course are built on the v4 Expert Instructor
Template: concepts explained then immediately practised, knowledge tested before
independent work begins, and the course ending with a project the student builds
entirely on their own.

---

## Output structure

Each generated prompt contains:

**Opening**
Two calibration questions asked before any teaching begins. The student's
answers personalise every example and milestone throughout the course.

**Modules 1–7 — Teaching modules**
Each module follows a strict discussion-then-activity rhythm. Every concept
is explained (discussion), then the student immediately does something with
it (activity) before the next concept begins. No two explanations appear
back-to-back without an exercise in between.

Each module also contains:
- An opening analogy that frames the whole module in plain language before
  any technical vocabulary is introduced
- 3–5 concepts, each with a discussion and an immediate activity
- An expected result for each activity (what correct looks like, what to
  revisit if wrong)
- 2–3 beginner traps taught explicitly with wrong/correct examples side by side
- A milestone — a personally meaningful build using everything in the module
- 2 check questions that gate progression to the next module

**Module 8 — Guided practice project**
A bridge between structured lessons and independent work. The student builds
a complete project from 4 options tied to their stated goal, still with
instructor guidance available. Four build phases: planning, incremental
build, debugging, refactoring.

**Final assessment — Part 1: Written exam**
A 4-section exam the student must pass before starting the capstone.

| Section | What it tests | Points |
|---|---|---|
| A — Knowledge | Recall and explanation without aids | 20 |
| B — Read and Predict | Reasoning through material without running/testing it | 25 |
| C — Apply | Producing or fixing something from scratch | 35 |
| D — Explain Your Reasoning | Justifying decisions, not just solutions | 20 |

Pass threshold: 72/100. Section failures trigger targeted re-teaching of
only the relevant modules, not the whole course.

**Final assessment — Part 2: Capstone project**
The student's proof of competence. Built entirely independently. Evaluated
against 5 criteria — all must be met, no partial credit:

1. Completeness — everything planned is present and working
2. Understanding — student can explain every part without prompting
3. Robustness — handles unexpected input, does not break outside happy path
4. Quality — clean, readable, another person could follow it
5. Pride — student would genuinely show this to someone else

The capstone includes a mandatory 4-question defence the student presents
when the build is complete. The instructor role shifts to reviewer during
this phase — no hints, no writing any part of the work.

**Closing**
A concrete summary of what the student can now do, 2–3 specific next
challenges, the best resources in the field, and a single honest closing
line specific to the subject and the student's goal.

---

## How to trigger it

The skill triggers on any request to create structured learning for a subject:

```
create a learning prompt for Python
make a course for learning Excel
build me a study plan for Spanish
I want to learn guitar — can you make me a structured prompt?
help me learn C# from scratch
```

It also triggers on casual phrasing:
```
make something to help me learn watercolour painting
I need to get good at Excel for work
I want to learn [anything]
```

If the subject is ambiguous (e.g. "Excel" could mean basic data entry or
advanced financial modelling), the skill asks one clarifying question before
generating.

---

## Design decisions

**Why discussion-then-activity per concept, not per module?**
A single milestone at the end of a module means the student can read five
concepts in a row without doing anything. By the time they reach the activity,
the earlier concepts have faded. The per-concept rhythm closes that gap —
the student acts on each idea while it is fresh, and the instructor gets a
signal after every concept rather than only at the end.

**Why save a .md file AND teach interactively?**
The saved prompt is portable — it works in any LLM, can be shared, and serves
as documentation. The interactive session is immediate — the student does not
have to copy anything or open a new conversation. Both serve different needs
and cost nothing to produce together.

**Why does the exam gate the capstone?**
A student who cannot pass the exam does not yet have the foundation to build
independently. Attempting the capstone without that foundation produces a
project the student cannot explain or defend — which destroys confidence
rather than building it. The exam is a checkpoint, not a punishment.

**Why are all exam questions fully authored?**
A prompt that says "write a question about X here" is not a finished product.
The skill authors every question in all four sections so the generated prompt
is ready to use immediately without any additional work.

**Why British English?**
The v4 template was written in British English. The skill inherits that
default. The generated prompt instructs the instructor to use British English
throughout: programme, organise, practise, colour. This can be changed by
specifying a preference in the request.

---

## Files

```
expert-instructor/
├── SKILL.md              — Full skill instructions (loaded when skill triggers)
├── README.md             — This file
└── references/
    ├── v2-template.md    — Documentation only
    ├── v3-template.md    — Documentation only
    └── v4-template.md    — Canonical template (skill reads this when generating)
```

---

## Version history

| Version | Change |
|---|---|
| v1 | Initial skill — flat module structure with single end-of-module milestone |
| v2 | Mandatory module tasks (7/10 to unlock next module); gated final exam (20 questions, 5 types); capstone as standalone phase with scoring rubric |
| v3 | Immediately begin teaching after calibration answers; no syllabus preamble |
| v4 | Analogies mandatory per module (full written-out, before any technical vocab); milestones replace scored tasks; four-section exam (Knowledge, Read and Predict, Apply, Explain Reasoning); five-criterion capstone rubric with no averaging; mandatory defend step; instructor role shifts to reviewer during capstone |
| v5 | Saves full prompt as .md file for portability and cross-LLM use; immediately begins interactive teaching in the same conversation using a calibration widget and one-concept-at-a-time pacing |