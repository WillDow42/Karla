@echo off
TITLE Administrator: AskMe.exe
IF EXIST david.dat GOTO ask
IF NOT EXIST david.dat GOTO make

:ask
set key=
CLS
ECHO ----------
ECHO Main Menu
ECHO ----------
ECHO.
set /p key=_User_Passcode: 
IF NOT EXIST %key%.txt GOTO ask
ping localhost -n 2 >nul

:main
CLS
TITLE AskMe.Cryptor
color 3
CHOICE /c ED /m "Encrypt / Decrypt "
IF %errorlevel%==1 GOTO enc
IF %errorlevel%==2 GOTO dec
EXIT

:make
CLS
ECHO.
set /p pass=_Passcode: 
ECHO [DATE] %DATE%>%pass%.txt
ECHO [TIME] %TIME%>>%pass%.txt
attrib +s +h %pass%.txt
ECHO _User_Passcode: %pass%>david.dat
ECHO [DATE] %DATE%>>david.dat
CLS
ping localhost -n 2 >nul
ECHO.
ECHO Restarting program. . .
ping localhost -n 4 >nul
start AskMe.bat
EXIT

:enc
set encfn=
TITLE AskMe.Cryptor - Encrypted Mode
CLS
DIR
ECHO.
set /p encfn=_Filename: 
IF NOT EXIST "%encfn%" ECHO
IF NOT EXIST "%encfn%" GOTO main
REN "%encfn%" AskMe[%encfn%].hlp
GOTO main

:dec
set decfn=
TITLE AskMe.Cryptor - Decrypted Mode
CLS
DIR
ECHO.
set /p decfn=_Filename: 
IF NOT EXIST AskMe[%decfn%].hlp ECHO
IF NOT EXIST AskMe[%decfn%].hlp GOTO main
REN AskMe[%decfn%].hlp "%decfn%"
GOTO main