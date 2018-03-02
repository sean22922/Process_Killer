@echo off

echo 歡迎使用本程式！
echo 本程式 20 秒後將自動終止學生端處理程序
echo 1. 終止學生端處理程序
echo 2. 自行輸入要終止的處理程序
echo 3. 離開
choice /T 20 /C 123 /D 1 /M "請輸入選項"
if errorlevel 3 goto 3
if errorlevel 2 goto 2 
if errorlevel 1 goto 1
cls

:1
cls
taskkill /im StudentMain.exe /f >nul 2>&1
if errorlevel 1 (echo 處理程式中止失敗...) else (echo 處理程序中止成功...)
goto 3

:2
cls
set /p processname=處理程序名稱:
taskkill /im %processname% /f >nul 2>&1
if errorlevel 1 (echo 處理程式中止失敗...) else (echo 處理程序中止成功...)
goto 3

:3
echo 按任意鍵關閉視窗
pause >nul
exit
