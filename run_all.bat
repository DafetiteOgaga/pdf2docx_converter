@echo off

rem set "dir=C:\Users\%username%\pdf2docx_converter"

call set_env_var.bat

set "dir=C:\Users\%username%\pdf2docx_converter"

call pdf2docx_installer_2.bat

cd "C:\Users\%username%\Desktop"
rmdir /s /q %dir%

rem echo .
rem echo .
rem echo ###########################################
rem echo ## Now, close this window.               ##
rem echo ## Open another window and run: pdf2word ##
rem echo ###########################################
rem echo .
rem echo .
