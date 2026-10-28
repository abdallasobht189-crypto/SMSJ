@echo off
cd /d "%~dp0"
if exist out rmdir /s /q out
mkdir out
dir /b /s "%~dp0SMSJ\*.java" > sources.txt
javac -d out -cp "lib\sqlite-jdbc-3.42.0.0.jar" @sources.txt
del sources.txt
if errorlevel 1 (
    echo.
    echo Compilation failed. Check the errors above.
    pause
    exit /b 1
)
java -cp "out;lib\sqlite-jdbc-3.42.0.0.jar" Main
pause
