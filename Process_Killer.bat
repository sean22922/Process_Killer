@echo off
goto check_Permissions

:check_Permissions
    net session >nul 2>&1
    if %errorLevel% == 0 (
        goto administrator_yes
    ) else (
        goto administrator_no
    )

:administrator_yes

echo   _       __                 _             ______
echo  ^| ^|     / /___ __________  (_)___  ____ _/ / / /
echo  ^| ^| /^| / / __ `/ ___/ __ \/ / __ \/ __ `/ / / / 
echo  ^| ^|/ ^|/ / /_/ / /  / / / / / / / / /_/ /_/_/_/  
echo  ^|__/^|__/\__,_/_/  /_/ /_/_/_/ /_/\__, (_^|_^|_)   
echo                                  /____/           
echo.
echo 看來你打算利用系統管理員身分執行這個程式,希望你明白自己在做什麼
echo Looks like you want to proceed with administrator privileges, hope you know what you are doing.
echo 如果操作不當,可能會導致藍屏或導致尚未儲存的工作遺失
echo If you do something wrong, you may cause BSOD or lose your unsaved work.
echo 若您覺得本程式不安全,請馬上按下視窗右上角的大叉叉
echo If you think this program is not safe, please press the big X botton on the top-right of this window.
echo.
echo 按下任意鍵以繼續... (10秒後將自動執行)
echo Press any botton to procced... (Auto start at 10 seconds.)
timeout /T 10 >nul
cls

:administrator_no
echo      ___   __  __             __  _             ______
echo     /   ^| / /_/ /____  ____  / /_(_)___  ____  / / / /
echo    / /^| ^|/ __/ __/ _ \/ __ \/ __/ / __ \/ __ \/ / / / 
echo   / ___ / /_/ /_/  __/ / / / /_/ / /_/ / / / /_/_/_/  
echo  /_/  ^|_\__/\__/\___/_/ /_/\__/_/\____/_/ /_(_^|_^|_)   
echo.
echo 看起來你沒有系統管理員權限,不過這個程式還是能夠運作的
echo Looks like you don't have administrator privileges. But this program can still functional.
echo 如果你遇到有處理程序需要管理員程序才能終止,請手動給予本程式系統管理員權限
echo If you meet some process that need administrator privileges to terminate, please give this program administrator privileges manually.
echo 若沒有的話,不當的操作仍然有可能會導致尚未儲存的工作遺失
echo Otherwise, if you do something wrong you may lose your unsaved work.
echo 若您覺得本程式不安全,請馬上按下視窗右上角的大叉叉
echo If you think this program is not safe, please press the big X botton on the top-right of this window.
echo.
echo 按下任意鍵以繼續... (10秒後將自動執行)
echo Press any botton to procced... (Auto start at 10 seconds.)
timeout /T 10 >nul
cls

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
echo  ######                                               #    #                               
echo  #     # #####   ####   ####  ######  ####   ####     #   #  # #      #      ###### #####  
echo  #     # #    # #    # #    # #      #      #         #  #   # #      #      #      #    # 
echo  ######  #    # #    # #      #####   ####   ####     ###    # #      #      #####  #    # 
echo  #       #####  #    # #      #           #      #    #  #   # #      #      #      #####  
echo  #       #   #  #    # #    # #      #    # #    #    #   #  # #      #      #      #   #  
echo  #       #    #  ####   ####  ######  ####   ####     #    # # ###### ###### ###### #    # 
echo.
echo 歡迎使用本程式！請輸入選項:
echo 1. 自行輸入要終止的處理程序(程序名稱)
echo 2. 自行輸入要終止的處理程序(PID)
echo 3. 離開
echo.
echo 0. 作者資訊
set /p choice=選項: || set choice=nothingchosen
if "%choice%"=="nothingchosen" goto error_zhtw
if /i "%choice%"=="0" goto 0_zhtw
if /i "%choice%"=="3" goto 3_zhtw
if /i "%choice%"=="2" goto 2_zhtw
if /i "%choice%"=="1" goto 1_zhtw

:1_zhtw
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

:2_zhtw
cls
set /p processpid=輸入你想要終止的處理程序的PID:
taskkill /pid %processpid% /f >nul 2>&1
if errorlevel 1 (
	echo 處理程式中止失敗... 也許該處理程序原本就不存在?
) else (
	echo 處理程序中止成功...
)
echo 按任意鍵關閉視窗...
pause >nul
exit

:3_zhtw
cls
echo 已取消...
echo 按任意鍵關閉視窗...
pause >nul
exit

:0_zhtw
cls
echo    `..-:://///++++++++++++///////:::::---...```                           
echo     ``..--:/++osssssssssssssssssssssssssssssssoo++/:-.`                   
echo                `..://+osssssssssssssssssssssssssssssssoo+:-.`             
echo           ```...---::/+osssssssssyyyyyyyyyyyyyyssssssssssssoo/:.`         
echo `.--:://++oossssssyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysssssssoo/`      
echo         `````..-::/+oossyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysso..-      
echo                      ``.-/+syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysso/` `      
echo                            `./syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyso-``..---.` 
echo                               .oyyyyyyyyyyyyyyyyyyyyyyyyyyyyso-`.-:+ssso//
echo                                /yyyyyyyyyyyyyyyyyyyyyyyyyyyss:  `-/sys+/:.
echo                               .syyysssoooosyyyyyyyyyyyyyyyyss-`-ossyy/`   
echo                             `:oo+/-..`````-oyyyyyyyyyyyyyyyyssosyyyys-..` 
echo                           `.--``           :syyyso+/::::+syyyyyyyyyysooss/
echo                           ``              `+so/-.` ``-:/osyyyyss+/:/-.`--.
echo                       ``   `` ``  `       -/-``  `-/+osyyyyyys/.          
echo                    `..://::/++/++/++:.``  ```./ooossysssyyyyyo.           
echo                    ``````````..-/+ossso+++++osssssoo/:-+yyyso-            
echo                                   ``.-:///////:--.``/:+oo++-`             
echo                                                    :yss/::-..``           
echo                                                 .:/sysssoo+++++/-`        
echo                                               -/ssys+:.`     ``.:/:`      
echo                                             `/syys/.              .:.     
echo                                            `+yyyo.                  ..    
echo                                           `+syys.                    `    
echo                                           -syyy/                          
echo                                           :yyyy-       作者:關@Kuan(sean22922)
echo                                           -syyy:       小屋網址:https://home.gamer.com.tw/sean22922
echo                                           .oyyys`      Github:https://github.com/sean22922
echo                                            :syyy+`     Copyright (c) 2018 Sean Kuan. 本程式已開源，並使用MIT自由開源軟體授權條款。
echo                                             :syyso.    (巴哈姆特電玩資訊站之圖樣版權非本人所擁有)
echo                                              .+syys+-`                    
echo                                                .+ssyss/:.``````.-.        
echo                                                  `.:+ossysso+/-.                       
echo 按任意鍵關閉視窗...
pause >nul
exit

:error_zhtw
echo 選項錯誤!請重新輸入選項!
timeout /T 3 >nul
cls
goto main_zhtw

:main_en
cls
echo  ######                                               #    #                               
echo  #     # #####   ####   ####  ######  ####   ####     #   #  # #      #      ###### #####  
echo  #     # #    # #    # #    # #      #      #         #  #   # #      #      #      #    # 
echo  ######  #    # #    # #      #####   ####   ####     ###    # #      #      #####  #    # 
echo  #       #####  #    # #      #           #      #    #  #   # #      #      #      #####  
echo  #       #   #  #    # #    # #      #    # #    #    #   #  # #      #      #      #   #  
echo  #       #    #  ####   ####  ######  ####   ####     #    # # ###### ###### ###### #    # 
echo.
echo Thank you for using this program! Please enter option:
echo 1. Enter the process name you want to terminate.
echo 2. Enter the process PID you want to terminate.
echo 3. Leave
echo.
echo 0. Author Information
set /p choice=Option: || set choice=nothingchosen
if "%choice%"=="nothingchosen" goto error_zhtw
if /i "%choice%"=="0" goto 0_zhtw
if /i "%choice%"=="3" goto 3_zhtw
if /i "%choice%"=="2" goto 2_zhtw
if /i "%choice%"=="1" goto 1_zhtw

:1_en
cls
set /p processname=Enter the process name you want to terminate(do not include".exe"):
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

:2_en
cls
set /p processname=Enter the process PID you want to terminate:
taskkill /pid %processpid% /f >nul 2>&1
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
cls
echo Cancelled...
echo Press any botton to close this window....
pause >nul
exit

:0_en
cls
echo    `..-:://///++++++++++++///////:::::---...```                           
echo     ``..--:/++osssssssssssssssssssssssssssssssoo++/:-.`                   
echo                `..://+osssssssssssssssssssssssssssssssoo+:-.`             
echo           ```...---::/+osssssssssyyyyyyyyyyyyyyssssssssssssoo/:.`         
echo `.--:://++oossssssyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysssssssoo/`      
echo         `````..-::/+oossyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysso..-      
echo                      ``.-/+syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyysso/` `      
echo                            `./syyyyyyyyyyyyyyyyyyyyyyyyyyyyyyso-``..---.` 
echo                               .oyyyyyyyyyyyyyyyyyyyyyyyyyyyyso-`.-:+ssso//
echo                                /yyyyyyyyyyyyyyyyyyyyyyyyyyyss:  `-/sys+/:.
echo                               .syyysssoooosyyyyyyyyyyyyyyyyss-`-ossyy/`   
echo                             `:oo+/-..`````-oyyyyyyyyyyyyyyyyssosyyyys-..` 
echo                           `.--``           :syyyso+/::::+syyyyyyyyyysooss/
echo                           ``              `+so/-.` ``-:/osyyyyss+/:/-.`--.
echo                       ``   `` ``  `       -/-``  `-/+osyyyyyys/.          
echo                    `..://::/++/++/++:.``  ```./ooossysssyyyyyo.           
echo                    ``````````..-/+ossso+++++osssssoo/:-+yyyso-            
echo                                   ``.-:///////:--.``/:+oo++-`             
echo                                                    :yss/::-..``           
echo                                                 .:/sysssoo+++++/-`        
echo                                               -/ssys+:.`     ``.:/:`      
echo                                             `/syys/.              .:.     
echo                                            `+yyyo.                  ..    
echo                                           `+syys.                    `    
echo                                           -syyy/                          
echo                                           :yyyy-       Author:關@Kuan(sean22922)
echo                                           -syyy:       Website:https://home.gamer.com.tw/sean22922
echo                                           .oyyys`      Github:https://github.com/sean22922
echo                                            :syyy+`     Copyright (c) 2018 Sean Kuan. This program is licensed under the MIT License.
echo                                             :syyso.    (The "巴哈姆特電玩資訊站" logo's copyright does not belong to me)
echo                                              .+syys+-`                    
echo                                                .+ssyss/:.``````.-.        
echo                                                  `.:+ossysso+/-.                       
echo Press any botton to close this window....
pause >nul
exit

:error_en
echo The option you entered is wrong! Please reenter!
timeout /T 3 >nul
cls
goto main_zhtw