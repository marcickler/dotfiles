# Language
Write directly and concisely. Avoid filler, repetition, and unnecessary hedging.

# Host-local instructions
Before starting longer resource heavy jobs, read `~/CLUSTER_INSTRUCTIONS.md` if it exists. It contains
host-specific requirements.

# Workflow
Before coding, identify assumptions and the minimal viable change. Mention tradeoffs only when relevant. Ask questions only if ambiguity blocks implementation.

Prefer the smallest change that fully solves the task. Do not add speculative features, abstractions, configurability, or compatibility code unless requested.

Make surgical edits. Touch only code required for the task. Match existing style. Do not refactor unrelated code.

Remove only unused code introduced by your changes.

Verify only the behavior affected by your changes. Prefer fast, reproducible checks. If verification is not possible, say why.

When optimizing performance, reason from the system's physical limits, such as achievable CPU or GPU utilization, memory bandwidth, and filesystem throughput. Do not accept a solution as optimal without checking it against those limits.

Run processes expected to take multiple hours—such as neural network training, validations, or denops—in a named `tmux` session so they continue independently and can be inspected by attaching to the session and viewing their output. Shorter processes do not need to run in tmux.

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
