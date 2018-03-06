@echo off

echo 警告! 本程式需要系統管理員權限
echo Warning! This program need administrator privileges.
echo 且操作不當,可能導致系統藍屏或導致尚未儲存的工作遺失
echo And if you do something wrong with it, it may cause BS or lose your unsaved work.
echo 若您覺得本程式不安全,請馬上按下視窗右上角的大叉叉
echo if you think this program is not safe, please press the big X botton on the top-right of this window.
echo.
echo 按下任意鍵以繼續...
echo Press any botton to procced...
pause >nul
cls

icacls "%SYSTEMROOT%\system32\config\system" >nul
if %errorlevel%==1 (
	rem 沒有權限 建立一個vbs產生權限呼叫自己
	set tmp=tmp.vbs
	echo set uac = CreateObject^ ("Shell.Application"^) > %tmp%
	echo uac.ShellExecute "%~s0", "", "", "runas", 1 >> %tmp%
	start /wait "" %tmp%
	del /q %tmp%
	exit /b
) else (
	rem 已經擁有管理員權限
	goto language
)

:language
for /F "tokens=3 delims= " %%G in ('reg query "hklm\system\controlset001\control\nls\language" /v Installlanguage') do (
if [%%G] EQU [0404] (
	goto main_zhtw
) else (
	goto main_en
)
)

:main_zhtw
cls
echo 歡迎使用本程式！
echo 本程式 20 秒後將自動終止學生端處理程序
echo 1. 終止學生端處理程序
echo 2. 自行輸入要終止的處理程序
echo 3. 離開
choice /T 20 /C 123 /D 1 /M "請輸入選項" /n
if errorlevel 3 (
	cls
	echo 已取消... 
	goto 3_zhtw
)
if errorlevel 2 goto 2_zhtw
if errorlevel 1 goto 1_zhtw

:main_en
cls
echo Thank you for using this program！
echo This program will automaticly terminate StudentMain.exe 20 seconds later.
echo 1. Terminate StudentMain.exe.
echo 2. Enter the process name you want to terminate.
echo 3. Leave
choice /T 20 /C 123 /D 1 /M "Please choose an option"
if errorlevel 3 (
	cls
	echo Cancelled...
	goto 3_en
)
if errorlevel 2 goto 2_en
if errorlevel 1 goto 1_en

:1_zhtw
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (
	echo 處理程式中止失敗... 也許該處理程序原本就不存在?
) else (
	echo 處理程序中止成功...
)
echo 按任意鍵關閉視窗...
pause >nul
exit

:2_zhtw
cls
set /p processname=輸入你想要終止的處理程序名稱(不包含結尾的.exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
	echo 處理程式中止失敗... 也許該處理程序原本就不存在?
) else (
	echo 處理程序中止成功...
)
echo 按任意鍵關閉視窗...
pause >nul
exit

:3_zhtw
echo 按任意鍵關閉視窗...
pause >nul
exit

:1_en
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (
	echo Failed to terminate process... 
	echo Maybe the process doesn't even exist?
) else (
	echo Process terminated sucessfully...
)
echo Press any botton to close this window....
pause >nul
exit

:2_en
cls
set /p processname=The process name you want to terminate(don't enter .exe):
taskkill /im %processname%.exe /f >nul 2>&1
if errorlevel 1 (
	echo Failed to terminate process... 
	echo Maybe the process doesn't even exist?
) else (
	echo Process terminated sucessfully...
)
echo Press any botton to close this window....
pause >nul
exit

:3_en
echo Press any botton to close this window....
pause >nul
exit