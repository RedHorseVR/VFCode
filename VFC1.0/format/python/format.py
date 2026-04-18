import os
import sys
from dedent import process_lines

def run_black(path):
    os.system(f"black \"{path}\"")

def apply_dedent(path, debug=False):
    with open(path, "r") as f:
        lines = f.readlines()

    out = process_lines(lines, debug=debug)

    with open(path, "w") as f:
        f.writelines(out)

if __name__ == "__main__":
    debug = False
    dedent_mode = False
    files = []

    # Parse args in ANY order
    for arg in sys.argv[1:]:
        if arg == "--debug":
            debug = True
            dedent_mode = True   # debug IMPLIES dedent
        elif arg == "--dedent":
            dedent_mode = True
        else:
            files.append(arg)

    # Always run Black
    for fname in files:
        run_black(fname)

        # Only run dedent when requested
        if dedent_mode:
            apply_dedent(fname, debug=debug)
