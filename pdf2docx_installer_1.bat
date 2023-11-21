@echo off

rem set "dir=C:\Users\%username%\pdf2docx_converter"

call set_env_var.bat

set "dir=C:\Users\%username%\pdf2docx_converter"

call pdf2docx_installer_2.bat
echo .
echo .
echo ###########################################
echo ## Now, close this window.				  ##
echo ## Open another window and run: pdf2word ##
echo ###########################################
