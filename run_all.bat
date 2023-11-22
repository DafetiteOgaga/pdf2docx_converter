@echo off

echo ########################################
echo ## PDF TO DOCX CONVERTER INSTALLATION ##
echo ########################################

call set_env_var.bat

set "dir=C:\Users\%username%\Desktop"

call pdf2docx_installer_2.bat


call %dir%\pdf2docx_converter\custom_commands_win\name.bat

echo .
echo ###########################################
echo ## Now, close this window.               ##
echo ## Open another window and run: pdf2word ##
echo ###########################################
echo .
echo .

pause

rmdir /s /q %dir%
