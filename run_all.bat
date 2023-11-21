@echo off

set "def_dir=C:\Users\%username%"

cd "%def_dir%\Desktop"

call set_env_var.bat

rem set "dir=%def_dir%\pdf2docx_converter"

call pdf2docx_installer_2.bat

echo Installation completed.

rem echo .
rem echo .
rem echo ###########################################
rem echo ## Now, close this window.               ##
rem echo ## Open another window and run: pdf2word ##
rem echo ###########################################
rem echo .
rem echo .

pause 