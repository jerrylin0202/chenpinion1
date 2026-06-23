@echo off
setlocal
cd /d "%~dp0"

set "GIT=git"
where git >nul 2>nul
if errorlevel 1 if exist "C:\Program Files\Git\cmd\git.exe" set "GIT=C:\Program Files\Git\cmd\git.exe"

rem clear stale locks
if exist ".git\config.lock" del /f ".git\config.lock"
if exist ".git\index.lock" del /f ".git\index.lock"

rem identity (local to this repo)
"%GIT%" config user.name "jerrylin0202"
"%GIT%" config user.email "jerrylin0202@gmail.com"

rem ensure remote origin exists
"%GIT%" remote get-url origin >nul 2>nul
if errorlevel 1 "%GIT%" remote add origin https://github.com/jerrylin0202/chenpinion1.git

echo [1/3] staging...
"%GIT%" add -A

echo [2/3] committing...
"%GIT%" commit -m "fix: keep confetti/hearts/bubbles under reduced-motion"

echo [3/3] pushing...
"%GIT%" push -u origin main

echo.
echo ============================================
echo Done. Site updates in ~1 min:
echo https://jerrylin0202.github.io/chenpinion1/
echo ============================================
echo.
pause
