import re
import sys

BLOCK = 4      # Black indentation size

def count_indent(line):
    indent = re.match(r"[ \t]*", line).group(0)
    return indent, len(indent)

def process_lines(lines, debug=False):
    print("processing dedent...");
    TAB = "-->" if debug else "\t"

    out = []
    prev_depth = 0

    for line in lines:
        stripped = line.strip()

        # Preserve empty lines exactly as-is
        if stripped == "":
            out.append(line)
            continue

        indent_str, raw_indent = count_indent(line)

        # Convert raw spaces to block depth
        curr_depth = raw_indent // BLOCK

        # Insert closure lines for dedents
        if curr_depth < prev_depth:
            for depth in range(prev_depth - 1, curr_depth - 1, -1):
                out.append(TAB * depth + "\n")

        # Rewrite the actual code line using tabs or -->
        new_line = TAB * curr_depth + stripped + "\n"
        out.append(new_line)

        prev_depth = curr_depth

        out = [ln for ln in out if not (ln.strip() == "" and not ln.startswith(("\t", " "))) ]
        final_out = []
        for ln in out:
            if ln.lstrip().startswith("def"):
                final_out.append("\n")
            final_out.append(ln)

    return final_out


if __name__ == "__main__":
    debug = "--debug" in sys.argv
    files = [a for a in sys.argv[1:] if a not in ("--debug",)]

    for fname in files:
        with open(fname, "r") as f:
            lines = f.readlines()

        out = process_lines(lines, debug=debug)

        with open(fname, "w") as f:
            f.writelines(out)
