@echo off

call name.bat

echo ....................................................................
echo Installing PDF to DOCX Converter ...
echo ....................................
cd..

set "wrong_dir=%cd%"

set "user_dir=C:\Users\%username%"

cd %user_dir%
if exist "%user_dir%\pdf2docx_converter" (
	echo Clone ok  ...
    set "dir_ok=ok"
) else (
	set "dir_ok=not_ok"
	git clone https://github.com/DafetiteOgaga/pdf2docx_converter.git
)

set "pdf2docx_converter=%user_dir%\pdf2docx_converter"

rem echo ....................................................................
rem echo Setting up neccessary files ...
rem echo ...............................
rem cd %pdf2docx_converter%
rem call copy_path_pdf2docx.bat

rem echo ....................................................................
rem echo Finishing setup ...
rem echo ...................
rem cd %pdf2docx_converter%
rem xcopy %pdf2docx_converter%\custom_command %user_dir%\xbin_windows /e /y /d

echo ....................................................................
echo Installing package and dependencies ...
cd %pdf2docx_converter%
call pip_install_pdf2docx.bat

echo ....................................................................
echo cleaning unneccessary files ...
echo ...............................
cd %user_dir%
echo .
echo .
echo ###########################################
echo ## Now, close this window.				  ##
echo ## Open another window and run: pdf2word ##
echo ###########################################
echo .
echo .
if "%dir_ok%" equ "ok" (
    echo Setup good ...
) else (
	echo Cleaning ...
    cd %wrong_dir%
	rmdir /s /q pdf2docx_converter
)

echo Installation completed.
