@echo off


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

echo ....................................................................
echo Installing package and dependencies ...
cd %pdf2docx_converter%
call pip_install_pdf2docx.bat

echo ....................................................................
echo Completed ...
echo ...............................
cd %user_dir%
