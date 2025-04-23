@echo off
:: Check if the registry key exists
reg query "HKEY_CURRENT_USER\Software\Classes\CLSID\{86CA1AA0-34AA-4E8B-A509-50C905BAE2A2}" >nul 2>&1
if %errorlevel% equ 0 (
    echo Switching to Windows 11 right-click menu...
    reg delete "HKEY_CURRENT_USER\Software\Classes\CLSID\{86CA1AA0-34AA-4E8B-A509-50C905BAE2A2}" /f
) else (
    echo Switching to Windows 10 right-click menu...
    reg add "HKEY_CURRENT_USER\Software\Classes\CLSID\{86CA1AA0-34AA-4E8B-A509-50C905BAE2A2}\InprocServer32" /f /ve
)

:: Restart Explorer
echo Restarting Windows Explorer...
taskkill /f /im explorer.exe
start explorer.exe
echo Done!
pause