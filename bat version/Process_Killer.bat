@echo off
@setlocal enableextensions enabledelayedexpansion
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params=%*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    goto OScheck

:OScheck
	cls
	SET count=1
	FOR /F "tokens=* USEBACKQ" %%F IN (`wmic os get Caption /value`) DO (
	 SET var!count!=%%F
	 SET /a count=!count!+1
     )
	if "Caption=Microsoft Windows 10" GEQ %var3%
		echo 目前不支援Windows UAC自動取得管理員權限！！！
		echo 請手動使用管理員身分啟動此程式！！！
		goto 3
	)	else ( exit /b )
:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
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
