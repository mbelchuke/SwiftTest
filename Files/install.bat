@echo off
ECHO.
ECHO.
ECHO **************************************************************************
ECHO *
ECHO * CO3 asset installation
ECHO *
ECHO * This script will now attempt to install all needed task runners,
ECHO * so you can compile distribution assets for deployment or development.
ECHO *
ECHO **************************************************************************
ECHO.
ECHO.

:: Remove existing node modules
:: **************************************************************************************
IF EXIST node_modules (
  ECHO.
  ECHO *** Removing existing node modules
  call rd "node_modules" /S /Q
  ECHO *** Done!
  ECHO.
)

:: Check to see if NPM is installed at all. Otherwise, abort execution immediately!
:: **************************************************************************************
call npm version > NUL
IF %ERRORLEVEL% NEQ 0 (
  ECHO.
  ECHO *** ***********************************************************************
  ECHO.
  ECHO *** NodeJS is not installed, or is not in your PATH. Please install NodeJS,
  ECHO *** reboot, and try again.
  ECHO.
  ECHO *** ***********************************************************************
  ECHO.
  EXIT /B %ERRORLEVEL%
)

ECHO.
ECHO *** NodeJS exists, running install script now.
ECHO.
call npm install

IF %ERRORLEVEL% NEQ 0 (
  GOTO :EXITWITHERROR
)

ECHO.
ECHO *** All needed NodeJS-packages installed.
ECHO.

:EXITWITHSUCCESS
ECHO.
ECHO ********************************************************************
ECHO.
ECHO INSTALLATION SUCCESSFUL!
ECHO.
ECHO You are ready to go!
ECHO.
ECHO Helpful commands:
ECHO - Build assets: . . . . . . . . . npm run build
ECHO - Build and watch assets during development:  . npm run deploy
ECHO.
ECHO ********************************************************************
ECHO.
EXIT /B 0


:EXITWITHERROR
ECHO.
ECHO ********************************************************************
ECHO.
ECHO INSTALLATION FAILED!
ECHO.
ECHO Something went wrong. Please correct the errors above and try again!
ECHO.
ECHO If the error has to do with "git" or "ENOGIT", it's probably because
ECHO you don't have Git in your Windows path. (Re)install the Git client
ECHO from here: https://git-scm.com/downloads
ECHO ... and make sure you allow usage in the Windows command prompt!
ECHO.
ECHO ********************************************************************
ECHO.
EXIT /B %ERRORLEVEL%