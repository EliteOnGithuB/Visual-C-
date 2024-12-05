@echo off
SetLocal EnableExtensions EnableDelayedExpansion
@echo Installing Visual C++
color 09
timeout 2 >nul

@echo Installing...
timeout 2 >nul
powershell Invoke-WebRequest "https://github.com/abbodi1406/vcredist/releases/download/v0.78.0/VisualCppRedist_AIO_x86_x64.exe" -OutFile "%temp%\VisualCppRedist_AIO_x86_x64.exe" >nul 2>&1
if not exist "%temp%\VisualCppRedist_AIO_x86_x64.exe" (
    @echo Error: Failed to download Visual C++ redistributable package.
    pause
    exit /b 1
)
%temp%\VisualCppRedist_AIO_x86_x64.exe /y
if %errorlevel% neq 0 (
    @echo Error: Failed to install Visual C++ redistributable package.
    pause
    exit /b %errorlevel%
)
del /f "%temp%\VisualCppRedist_AIO_x86_x64.exe"

powershell Invoke-WebRequest "https://aka.ms/vs/17/release/vc_redist.x64.exe" -OutFile "%temp%\vc_redist.x64.exe" >nul 2>&1
if not exist "%temp%\vc_redist.x64.exe" (
    @echo Error: Failed to download vc_redist.x64.exe.
    pause
    exit /b 1
)
%temp%\vc_redist.x64.exe /install /passive /norestart
if %errorlevel% neq 0 (
    @echo Error: Failed to install vc_redist.x64.exe.
    pause
    exit /b %errorlevel%
)
del /f "%temp%\vc_redist.x64.exe"

powershell Invoke-WebRequest "https://aka.ms/vs/17/release/vc_redist.x86.exe" -OutFile "%temp%\vc_redist.x86.exe" >nul 2>&1
if not exist "%temp%\vc_redist.x86.exe" (
    @echo Error: Failed to download vc_redist.x86.exe.
    pause
    exit /b 1
)
%temp%\vc_redist.x86.exe /install /passive /norestart
if %errorlevel% neq 0 (
    @echo Error: Failed to install vc_redist.x86.exe.
    pause
    exit /b %errorlevel%
)
del /f "%temp%\vc_redist.x86.exe"

powershell Invoke-WebRequest "https://download.visualstudio.microsoft.com/download/pr/907765b0-2bf8-494e-93aa-5ef9553c5d68/a9308dc010617e6716c0e6abd53b05ce/windowsdesktop-runtime-8.0.8-win-x64.exe" -OutFile "%temp%\windowsdesktop-runtime-8.0.8-win-x64.exe" >nul 2>&1
if not exist "%temp%\windowsdesktop-runtime-8.0.8-win-x64.exe" (
    @echo Error: Failed to download windowsdesktop-runtime-8.0.8-win-x64.exe.
    pause
    exit /b 1
)
%temp%\windowsdesktop-runtime-8.0.8-win-x64.exe /install /passive /norestart
if %errorlevel% neq 0 (
    @echo Error: Failed to install windowsdesktop-runtime-8.0.8-win-x64.exe.
    pause
    exit /b %errorlevel%
)
del /f "%temp%\windowsdesktop-runtime-8.0.8-win-x64.exe"

@echo All installations finished!
timeout 2 >nul
exit /b
