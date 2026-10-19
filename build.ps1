# Build and Run Script for Hospital Management System

Write-Host "Building Hospital Management System..." -ForegroundColor Green

# Create build directories
if (-not (Test-Path "build")) {
    New-Item -ItemType Directory -Path "build" | Out-Null
}
if (-not (Test-Path "build\classes")) {
    New-Item -ItemType Directory -Path "build\classes" | Out-Null
}

# Set classpath
$classpath = "jar files\javax.activation-1.2.0.jar;jar files\javax.mail-1.6.2.jar;jar files\jcalendar-1.4.jar;jar files\mysql-connector-j-9.1.0.jar"

# Compile all Java files
Write-Host "Compiling Java files..." -ForegroundColor Yellow
$compileResult = javac -d build\classes -cp $classpath -sourcepath src @(
    "src\cws\*.java"
    "src\cws\admin\*.java"
    "src\cws\staff\*.java"
    "src\cws\doctor\*.java"
    "src\cws\DBC\*.java"
    "src\cws\email\*.java"
    "src\cws\passwordGenerator\*.java"
) 2>&1

if ($LASTEXITCODE -ne 0) {
    Write-Host "Compilation failed!" -ForegroundColor Red
    Write-Host $compileResult
    Read-Host "Press Enter to exit"
    exit 1
}

Write-Host "Compilation successful!" -ForegroundColor Green
Write-Host ""
Write-Host "Running Hospital Management System..." -ForegroundColor Cyan
Write-Host ""

# Run the application
$runClasspath = "build\classes;$classpath"
java -cp $runClasspath cws.Main

Write-Host ""
Read-Host "Press Enter to exit"
