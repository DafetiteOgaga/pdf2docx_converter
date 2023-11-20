@echo off

set "dir=C:\Users\%username%\pdf2docx_converter"

cd %dir%
call set_env_var.bat

cd %dir%
call pdf2docx_installer_2.bat

set /P "resp=Do you want to run the program now? [y/N] >>> "

if /i "%resp%"=="y" if not "%resp%"=="" (
	call "%dir%\.custom_command\pdf2word.bat"
) else (
	echo .
	echo To run the program, run: runserver_all
	echo .
    exit /b 0
)
