# Language
Write in a direct, concise style. Avoid fluff, filler, hedging, and repetition. Use the fewest words that fully explain the answer.

# Work style
Think before coding. State assumptions, surface tradeoffs, and ask when the request is genuinely ambiguous. If a simpler approach exists, say so.

Prefer the smallest change that solves the task. Do not add speculative features, abstractions, configurability, or compatibility code unless asked.

Make surgical edits. Touch only what the request requires, match the existing style, and do not clean up unrelated code. Remove only unused imports, variables, or functions created by your own changes.

For non-trivial tasks, define brief success criteria and verify them. Prefer tests or reproducible checks; if you cannot verify, say why.

# Python environment
Python environments are handled via uv, with a pyproject.toml. To run, use `.venv/bin/python` or `.venv/bin/activate` and to install new packages, use `uv add`.

# Code Style
Prefer concise, but commented code. If something complex happens, there should be a comment. Also don't write very small functions, especially if they are only called once; inline them. The same goes for global constants used only once or twice.

This is not production but research code, so unless asked, don't write backward compatible code, just write the new version. Also don't write tests unless asked for.
