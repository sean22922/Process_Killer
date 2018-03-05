@echo off


for /F "tokens=3 delims= " %%G in ('reg query "hklm\system\controlset001\control\nls\language" /v Installlanguage') do (
if [%%G] EQU [0404] (
  goto main_zhtw
) else (
  goto main_en
)
)

:main_zhtw
echo 歡迎使用本程式！
echo 本程式 20 秒後將自動終止學生端處理程序
echo 1. 終止學生端處理程序
echo 2. 自行輸入要終止的處理程序
echo 3. 離開
choice /T 20 /C 123 /D 1 /M "請輸入選項"
if errorlevel 3 goto 3_zhtw
if errorlevel 2 goto 2_zhtw
if errorlevel 1 goto 1_zhtw

:main_en
echo Thank you for using this program！
echo This program will automaticly terminate StudentMain.exe 20 seconds later.
echo 1. Terminate StudentMain.exe.
echo 2. Enter the process name you want to terminate.
echo 3. Leave
choice /T 20 /C 123 /D 1 /M "Please choose an option"
if errorlevel 3 goto 3_en
if errorlevel 2 goto 2_en
if errorlevel 1 goto 1_en

:1_zhtw
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (
echo 處理程式中止失敗...
echo 也許處理程序原本就不存在? 或是我沒拿到系統管理權限?
) else (
echo 處理程序中止成功...
)
goto 3

:2_zhtw
cls
set /p processname=輸入你想要終止的處理程序名稱(不包含結尾的.exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
echo 處理程式中止失敗...
echo 也許處理程序原本就不存在? 或是我沒拿到系統管理權限?
) else (
echo 處理程序中止成功...
)
goto 3

:3_zhtw
echo 按任意鍵關閉視窗...
pause >nul
exit

:1_en
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (
echo Failed to terminate process... 
echo Maybe the process doesn't even exist? or i didn't get admin privileges?
) else (
echo Process terminated sucessfully...
)
goto 3

:2_en
cls
set /p processname=The process name you want to terminate(don't enter .exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
echo Failed to terminate process... 
echo Maybe the process doesn't even exist? or i didn't get admin privileges?
) else (
echo Process terminated sucessfully...
)
goto 3

:3_en
echo Press any botton to close this window....
pause >nul
exit