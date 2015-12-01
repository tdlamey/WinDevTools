@echo off

if not exist C:\Windows.old\NUL (
    echo The C:\Windows.old folder is already deleted.
    echo.
    PAUSE
    EXIT /B 2
)

net session >nul 2>&1
if %errorLevel% == 0 (
    takeown /F C:\Windows.old\* /R /A
    cacls C:\Windows.old\*.* /T /grant administrators:F
    rmdir /S /Q C:\Windows.old\
    echo The operation completed successfully.
    PAUSE
    EXIT /B 0
	
) else (
    echo Error: Administrator privileges required.
    echo.
    PAUSE
    EXIT /B 5
)
