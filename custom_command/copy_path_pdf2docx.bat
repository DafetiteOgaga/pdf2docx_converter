@echo off

set "repo_dir_pdf=%cd%"
echo repo_dir_pdf: %repo_dir_pdf%
xcopy C:\Users\%username%\pdf2docx_converter\custom_command C:\Users\%username%\xbin_windows /e /y /d
