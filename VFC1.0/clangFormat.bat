echo FORMATTING ::::::::::::::::::::::::::::::::::


rem clang-format -i "%1"


 clang-format -style=file:"C:/Users/lopezl10/AppData/Local/RedHorseVR/VFCode/VFC1.0/.clang-format" -i "%1"

rem clang-format -style=file:".clang-format" -i "%1"

rem cmake -S . -B build -G \"Unix Makefiles\" -DFSW_CLANG_TIDY=1 && cmake --build build --target clang-tidy  "%1"

REM pause