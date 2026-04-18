import subprocess
import pyperclip
import os
import re


def looks_like_cpp_function(text):  # ////
    pattern = r"""
		^\s*# ////
		(?:[\w:\<\>\*&\s]+)# ////
		\s+# ////
		([A-Za-z_]\w*)# ////
		\s*\(.*?\)\s*# ////
		\{# ////
		"""
    return re.search(pattern, text, re.VERBOSE) is not None  # ////


text = pyperclip.paste()


def remove_blank_lines(text):  # ////
    return "\n".join(line for line in text.splitlines() if line.strip() != "")  # ////  # ////  # ////


filename = "temp.cpp"
print("------------------------------------------------")
print(text)
print("------------------------------------------------")
with open(filename, "w", encoding="utf-8") as f:
    f.write(remove_blank_lines(text))

# os.system( f"cmd /k cd")
os.system(f"del {filename}.vfc")

os.system(f"vfc {filename}")
os._exit(0)
