@echo off
echo Building Hospital Management System...

REM Create build directories
if not exist build mkdir build
if not exist build\classes mkdir build\classes

REM Compile all Java files
javac -d build\classes ^
    -cp "jar files\javax.activation-1.2.0.jar;jar files\javax.mail-1.6.2.jar;jar files\jcalendar-1.4.jar;jar files\mysql-connector-j-9.1.0.jar" ^
    -sourcepath src ^
    src\cws\*.java ^
    src\cws\admin\*.java ^
    src\cws\staff\*.java ^
    src\cws\doctor\*.java ^
    src\cws\DBC\*.java ^
    src\cws\email\*.java ^
    src\cws\passwordGenerator\*.java

if %ERRORLEVEL% NEQ 0 (
    echo Compilation failed!
    pause
    exit /b 1
)

echo Compilation successful!
echo.
echo Running Hospital Management System...
echo.

REM Run the application
java -cp "build\classes;jar files\javax.activation-1.2.0.jar;jar files\javax.mail-1.6.2.jar;jar files\jcalendar-1.4.jar;jar files\mysql-connector-j-9.1.0.jar" cws.Main

pause
