@echo off

set "repo_dir_pdf=%cd%"
echo repo_dir_pdf: %repo_dir_pdf%
xcopy %repo_dir_pdf%\custom_command C:\Users\%username%\xbin_windows /e /y /d
