# Language
Write directly and concisely. Avoid filler, repetition, and unnecessary hedging.

# Workflow
Before coding, identify assumptions and the minimal viable change. Mention tradeoffs only when relevant. Ask questions only if ambiguity blocks implementation.

Prefer the smallest change that fully solves the task. Do not add speculative features, abstractions, configurability, or compatibility code unless requested.

Make surgical edits. Touch only code required for the task. Match existing style. Do not refactor unrelated code.

Remove only unused code introduced by your changes.

Verify only the behavior affected by your changes. Prefer fast, reproducible checks. If verification is not possible, say why.

# Python
Python environments use `uv` with `pyproject.toml`.

Run Python with:
- `.venv/bin/python`
- or `.venv/bin/activate`

Install packages with:
- `uv add`

# Code Style
Prefer concise code. Add comments only where intent or logic is non-obvious.

Avoid tiny single-use functions or one-off abstractions. Inline simple logic unless reuse materially improves clarity.

This is research code, not production infrastructure. Unless requested:
- do not add backward compatibility layers
- do not introduce defensive abstractions
- do not write tests
