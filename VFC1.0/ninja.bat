cls
@echo off
echo ==================================
echo Configuring with CMake and Ninja...
echo ==================================

:: Clean previous build if needed
if exist build (
    rmdir /s /q build
)

mkdir build
cd build

:: Run CMake with Ninja generator
cmake -G "Ninja" ..

:: Build with Ninja
ninja

cd ..
echo ==================================
echo Cleaning up junk files...
echo ==================================

:: Delete junk except target files in bin/
rmdir /s /q build\lib
rmdir /s /q build\CMakeFiles
rmdir /s /q build\googletest-build

del build\cmake_install.cmake 2>nul
del build\build.ninja 2>nul
del build\CMakeCache.txt 2>nul

:: Optional: clean nested subdirs
for /D %%f in (build\CMakeFiles\*) do (
    rmdir /s /q "%%f"
)

echo Done.

pause
