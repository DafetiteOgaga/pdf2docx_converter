@echo off

echo "Installing PDF to DOCX Converter ..."
set "wrong_dir=%cd%"

set "user_dir=C:\Users\%username%"

cd %user_dir%
git clone https://github.com/DafetiteOgaga/pdf2docx_converter.git

set "pdf2docx_converter=%user_dir%\pdf2docx_converter"

echo "Setting up neccessary files ..."
cd %pdf2docx_converter%
call set_env_var.bat

echo "Finishing setup ..."
cd %pdf2docx_converter%
xcopy %pdf2docx_converter%\.custom_command C:\Users\%username%\xbin_windows /e

echo cleaning unneccessary files ...
cd %wrong_dir%
cd ..
rmdir /s /q pdf2docx_converter

echo "Installation complete."

rem pause
