@ECHO OFF

CD %~dp0

echo %~dp0

@REM https://gist.github.com/cjwinchester/64a921d1190aefb8eae1
for /f "skip=1" %%x in ('wmic os get localdatetime') do if not defined MyDate set MyDate=%%x
for /f %%x in ('wmic path win32_localtime get /format:list ^| findstr "="') do set %%x
set fmonth=00%Month%
set fday=00%Day%
set today=%fmonth:~-2%-%fday:~-2%-%Year%

DATE 01-07-2022
POWERSHELL -command "& '.\scripts\T32_start.ps1'"
TIMEOUT 5
DATE %today%


