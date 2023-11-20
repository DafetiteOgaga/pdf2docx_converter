@echo off

rem set "dir=C:\Users\%username%\pdf2docx_converter"

call set_env_var.bat

echo ................................
echo current dir: %cd%
set "dir=C:\Users\%username%\pdf2docx_converter"
rem cd %dir%
echo later dir: %cd%
echo ................................

call pdf2docx_installer_2.bat

set /P "resp=Do you want to run the program now? [y/N] >>> "

if /i "%resp%"=="y" if not "%resp%"=="" (
	call "%dir%\custom_command\pdf2word.bat"
) else (
	echo .
	echo To run the program, run: runserver_all
	echo .
    exit /b 0
)
