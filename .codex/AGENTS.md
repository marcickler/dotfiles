# Language
Write in a direct, concise style. Avoid fluff, filler, hedging, and repetition. Use the fewest words that fully explain the answer.

# Python environment
Python environments are handled via uv, with a pyproject.toml. To run, use `.venv/bin/python` or `.venv/bin/activate` and to
install new packages, use `uv add`.

# Code Style
I prefer concise, but commented code. If something complex happens, there should be a comment. Also I don't like very small functions, especially if they are only called once, they should be inlined. The same for global constants. If they are only used once or twice, inline them.
I am not writing production but research code, so if I didn't ask for it, don't write backward compatible code, just write the new version.

