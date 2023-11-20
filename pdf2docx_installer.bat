@echo off

echo Installing PDF to DOCX Converter ...
set "wrong_dir=%cd%"

set "user_dir=C:\Users\%username%"

cd %user_dir%
echo for clone okay: %cd%
if exist "%user_dir%\pdf2docx_converter" (
	echo Clone ok  ...
    set "dir_ok=ok"
) else (
	set "dir_ok=not_ok"
	git clone https://github.com/DafetiteOgaga/pdf2docx_converter.git
)

set "pdf2docx_converter=%user_dir%\pdf2docx_converter"

echo Setting up neccessary files ...
cd %pdf2docx_converter%
call set_env_var.bat

echo Finishing setup ...
cd %pdf2docx_converter%
xcopy %pdf2docx_converter%\.custom_command C:\Users\%username%\xbin_windows /e /y

echo cleaning unneccessary files ...
cd %user_dir%

rem set "user_dir=C:\Users\YourUserName"  REM Change YourUserName to the actual user name
echo user_dir: %user_dir%
echo wrong_dir: %wrong_dir%
echo for cleaning: %cd%
if "%dir_ok%" equ "ok" (
    echo Setup good ...
) else (
	echo Cleaning ...
    cd %wrong_dir%
	cd ..
	rmdir /s /q pdf2docx_converter
	cd %user_dir%
)

echo Installation complete.

rem pause
