@Echo off
Echo ############################################################
Echo ##                                                        ##
Echo ##                  SymLink DeInstaller                   ##
Echo ##                                                        ##
Echo ##                      !ATTENTION!                       ##
Echo ##                                                        ##
Echo ## THIS CMD FILE REMOVES THE SYMLINKS OR !ACTUAL FOLDERS! ##
Echo ##      !Edit VST   paths in this file, if necessary!     ##
Echo ##                                                        ##
Echo ############################################################
chcp 861>nul
PAUSE
:: BatchGotAdmin BEGIN https://sites.google.com/site/eneerge/home/BatchGotAdmin | https://ss64.com/nt/rem.html | https://ss64.com/nt/cacls.html
:: Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

:: If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%~dp0getadmin.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%~dp0getadmin.vbs"

    "%~dp0getadmin.vbs"
    exit /B

:gotAdmin
    if exist "%~dp0getadmin.vbs" ( del "%~dp0getadmin.vbs" )
    pushd "%CD%"
    CD /D "%~dp0"
:: BatchGotAdmin END

:: x86? BEGIN
Set xOS=x64& If "%PROCESSOR_ARCHITECTURE%"=="x86" (
If Not Defined PROCESSOR_ARCHITEW6432 Set xOS=x86
)
Echo OS - %xOS%
If "%xOS%"=="x86" (
  goto x86Windows
) Else (
  goto x64Windows
)
:: x86? END

GOTO START_POINT
:: Source Directories Structure BEGIN

:: Source Directories Structure END
:START_POINT

:x64Windows
:: x64 Windows BEGIN

cmd /c rmdir "%COMMONPROGRAMFILES%\VST3\Valhalla DSP"
cmd /c rmdir "%PROGRAMDATA%\Valhalla DSP, LLC" /s /q
cmd /c rmdir "%PROGRAMDATA%\ValhallaPlate" /s /q
cmd /c rmdir "%PROGRAMDATA%\ValhallaDelay" /s /q
cmd /c rmdir "%PROGRAMDATA%\ValhallaRoom" /s /q
cmd /c rmdir "%PROGRAMDATA%\ValhallaRoomPreferences" /s /q
cmd /c rmdir "%PROGRAMDATA%\ValhallaShimmer" /s /q
cmd /c rmdir "%PROGRAMDATA%\ValhallaUberMod" /s /q
cmd /c rmdir "%PROGRAMDATA%\ValhallaVintageVerb" /s /q
cmd /c rmdir "%PROGRAMDATA%\ValhallaVintageVerbPreferences" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\Valhalla DSP, LLC" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\ValhallaPlate" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\ValhallaRoom" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\ValhallaRoomPreferences" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\ValhallaShimmer" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\ValhallaUberMod" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\ValhallaVintageVerb" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\ValhallaVintageVerbPreferences" /s /q
cmd /c rmdir "%USERPROFILE%\AppData\Roaming\ValhallaDelay" /s /q

CD /d "%~dp0"
:: [[[OPTIONAL: IT IS A PLACE FOR ADDITIONAL x64 Windows COMMANDS]]]

:: x64 Windows END
goto OUT

:x86Windows
:: x86 Windows BEGIN

CD /d "%~dp0"
:: [[[OPTIONAL: IT IS A PLACE FOR ADDITIONAL x86 Windows COMMANDS]]]

:: x86 Windows END
goto OUT

:OUT
PAUSE
EXIT

