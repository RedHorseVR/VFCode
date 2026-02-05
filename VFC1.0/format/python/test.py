import re


def count_indent(line):
    indent = re.match(r"[ \t]*", line).group(0)
    return indent, len(indent)


def process_lines(lines):
    out = []
    prev_indent = 0
    for line in lines:
        stripped = line.strip()
        if stripped == "":
            out.append(line)
            continue

        indent_str, indent_len = count_indent(line)
        if indent_len < prev_indent:
            for level in range(prev_indent, indent_len, -1):
                out.append(" " * level + "\n")

        out.append(line)
        prev_indent = indent_len

    return out
