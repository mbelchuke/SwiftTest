@echo off
ECHO.
ECHO.
ECHO **************************************************************************
ECHO *
ECHO * Smartpage A/S watch assets
ECHO *
ECHO * This script will now attempt build assets
ECHO *
ECHO **************************************************************************
ECHO.
ECHO.

call npm run build:webpack

IF %ERRORLEVEL% NEQ 0 (
  GOTO :EXITWITHERROR
)

EXIT /B %ERRORLEVEL%