@echo off

set "repo_dir_pdf=%cd%"
xcopy %repo_dir_pdf%\custom_command C:\Users\%username%\xbin_windows /e /y /d
