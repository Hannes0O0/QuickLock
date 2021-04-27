@echo off

:main
::Explaination
echo Enter 1 to install the Program. && echo; && echo Enter 2 to uninstall the Program. && echo; && echo Enter 3 to exit the (un)installer. && echo; && echo;

set /p number=Enter Number:

if %number% == 1 goto install
if %number% == 2 goto uninstall
if %number% == 3 exit

::If a number wich accept for 1,2,3 was entered
cls && echo Error, %number% is not a valid number. && echo Please enter a valid number! && echo;
goto main
break

:install
xcopy /y /i "batch_scripts" "%APPDATA%\Microsoft\Windows\Start Menu\batch_scripts"
xcopy /y "shortcuts" "%APPDATA%\Microsoft\Windows\Start Menu"
cls && echo Installed!
pause
cls && echo A system restart is recommendet! && echo; && echo Enter 1 to restart your computer. && echo Enter something else to exit. && echo;
set /p restart=Enter Number:
if %restart% ==1 shutdown /r /t 0
exit




:uninstall
del /q "%APPDATA%\Microsoft\Windows\Start Menu\batch_scripts\*.*"
rmdir "%APPDATA%\Microsoft\Windows\Start Menu\batch_scripts"
del /q "%APPDATA%\Microsoft\Windows\Start Menu\lock.lnk"
del /q "%APPDATA%\Microsoft\Windows\Start Menu\unlock.lnk"
cls && echo Uninstalled!
pause
exit