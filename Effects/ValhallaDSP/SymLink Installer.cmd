@Echo off
Echo ############################################################
Echo ##                                                        ##
Echo ##                   SymLink Installer                    ##
Echo ##                                                        ##
Echo ##                      !ATTENTION!                       ##
Echo ##                                                        ##
Echo ##  THIS CMD FILE CREATES A SYMLINKS FROM THE FOLDER /C/  ##
Echo ##      !Edit VST   paths in this file, if necessary!     ##
Echo ##                                                        ##
Echo ############################################################
chcp 861>nul

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

cmd /c mkdir "%COMMONPROGRAMFILES%\VST3"
cmd /c mklink /d "%COMMONPROGRAMFILES%\VST3\Valhalla DSP" "%~dp0C\Program Files\Common Files\VST3\Valhalla DSP"
cmd /c mklink /d "%PROGRAMDATA%\Valhalla DSP, LLC" "%~dp0C\ProgramData\Valhalla DSP, LLC"
cmd /c mklink /d "%PROGRAMDATA%\ValhallaPlate" "%~dp0C\ProgramData\ValhallaPlate"
cmd /c mklink /d "%PROGRAMDATA%\ValhallaRoom" "%~dp0C\ProgramData\ValhallaRoom"
cmd /c mklink /d "%PROGRAMDATA%\ValhallaDelay" "%~dp0C\ProgramData\ValhallaDelay"
cmd /c mklink /d "%PROGRAMDATA%\ValhallaRoomPreferences" "%~dp0C\ProgramData\ValhallaRoomPreferences"
cmd /c mklink /d "%PROGRAMDATA%\ValhallaShimmer" "%~dp0C\ProgramData\ValhallaShimmer"
cmd /c mklink /d "%PROGRAMDATA%\ValhallaUberMod" "%~dp0C\ProgramData\ValhallaUberMod"
cmd /c mklink /d "%PROGRAMDATA%\ValhallaVintageVerb" "%~dp0C\ProgramData\ValhallaVintageVerb"
cmd /c mklink /d "%PROGRAMDATA%\ValhallaVintageVerbPreferences" "%~dp0C\ProgramData\ValhallaVintageVerbPreferences"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\Valhalla DSP, LLC" "%~dp0C\Users\(Current User Name)\AppData\Roaming\Valhalla DSP, LLC"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\ValhallaPlate" "%~dp0C\Users\(Current User Name)\AppData\Roaming\ValhallaPlate"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\ValhallaRoom" "%~dp0C\Users\(Current User Name)\AppData\Roaming\ValhallaRoom"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\ValhallaRoomPreferences" "%~dp0C\Users\(Current User Name)\AppData\Roaming\ValhallaRoomPreferences"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\ValhallaShimmer" "%~dp0C\Users\(Current User Name)\AppData\Roaming\ValhallaShimmer"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\ValhallaUberMod" "%~dp0C\Users\(Current User Name)\AppData\Roaming\ValhallaUberMod"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\ValhallaDelay" "%~dp0C\Users\(Current User Name)\AppData\Roaming\ValhallaDelay"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\ValhallaVintageVerb" "%~dp0C\Users\(Current User Name)\AppData\Roaming\ValhallaVintageVerb"
cmd /c mklink /d "%USERPROFILE%\AppData\Roaming\ValhallaVintageVerbPreferences" "%~dp0C\Users\(Current User Name)\AppData\Roaming\ValhallaVintageVerbPreferences"

CD /d "%~dp0"
:: [[[OPTIONAL: IT IS A PLACE FOR ADDITIONAL x64 Windows COMMANDS]]]
CALL "%~dp0ValhallaDSP_KeyGen.exe"
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

