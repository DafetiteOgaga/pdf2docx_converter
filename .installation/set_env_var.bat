@echo off

rem change this string to the name of the directory to use for your custom commands
set "custom_command=xbin_windows"



set "NEW_ENV_VAR=C:\Users\%username%\%custom_command%"
echo ....................................................................
echo NEW_ENV_VAR: %NEW_ENV_VAR%
echo ....................................................................
for /f "tokens=2,*" %%I in ('reg query "HKCU\Environment" /v PATH ^| find "REG_SZ"') do (
    set "CURRENT_ENV_VAR=%%J"
)

rem Check if the new path is already in the current path
echo %CURRENT_ENV_VAR% | find /i "%NEW_ENV_VAR%" > nul
if errorlevel 1 (
    rem Append the new path to the existing PATH
    setx PATH "%CURRENT_ENV_VAR%;%NEW_ENV_VAR%"
    echo variable PATH updated successfully!...##############################
) else (
    echo New variable already exists in the current PATH...##################
)

echo ....................................................................
rem echo new variables ...
rem echo ....................................................................
rem Retrieve the updated PATH variable
for /f "tokens=2,*" %%I in ('reg query "HKCU\Environment" /v PATH ^| find "REG_SZ"') do (
    set "UPDATED_ENV_VAR_PATH=%%J"
)
rem echo UPDATED_ENV_VAR: %UPDATED_ENV_VAR_PATH%
rem echo ....................................................................

endlocal
