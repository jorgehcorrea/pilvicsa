@echo off
REM ============================================================
REM  Pilvicsa — Phase B folder restructure script
REM  Run this from inside your pilvicsa folder:
REM  cd C:\xampp\htdocs\pilvicsa
REM  phase_b_restructure.bat
REM ============================================================

echo Starting Pilvicsa Phase B folder restructure...
echo.

REM ── Step 1: Create new top-level images/ folder ──
if not exist "images" mkdir images
echo Created: images\

REM ── Step 2: Move everything from demos\business\images\ to images\ ──
if exist "demos\business\images" (
    xcopy "demos\business\images\*" "images\" /E /I /Y /Q
    echo Copied: demos\business\images\ to images\
) else (
    echo WARNING: demos\business\images\ not found - skipping image copy
)

REM ── Step 3: Copy business.css into css\ ──
if exist "demos\business\business.css" (
    copy "demos\business\business.css" "css\business.css" /Y
    echo Copied: demos\business\business.css to css\business.css
) else (
    echo WARNING: demos\business\business.css not found - skipping
)

REM ── Step 4: Copy updated HTML files from the ZIP ──
REM  (you need to have extracted pilvicsa_phase_b.zip first)
echo.
echo NOTE: Now copy the 11 updated HTML files from pilvicsa_phase_b.zip
echo       into this folder, replacing the existing ones.
echo.

REM ── Step 5: Verify demos\ folder can now be removed ──
echo.
echo When you have confirmed the site works on XAMPP, you can safely delete:
echo   demos\
echo.
echo To delete it run:
echo   rmdir /S /Q demos
echo.

echo Done! Test the site on XAMPP before committing to git.
pause
