@echo off
title [ FIX NETWORK] and [CLEAN JUNKS]
color 0A
: Menu
cls
echo 1. Flush DNS + Reset IP
echo 2. Clear Temp folder
echo 3. Reboot/shutdown
echo 4. Exit
echo.
set /p answer=Type the number of your option and press ENTER KEY:
if %answer%==1 goto Flushdns
if %answer%==2 goto Cleartemp
if %answer%==3 goto rbst
if %answer%==4 goto Exit
:Exit
cls
echo Press Enter from your keyboard to close this program.
echo.
pause
exit /b
:Flushdns
cls
Ipconfig /flushdns
Ipconfig /registerdns
Ipconfig /release
Ipconfig /renew
Netsh winsock reset
netsh winhttp reset proxy
netsh winhttp reset tracing
netsh winsock reset catalog
netsh int ipv4 reset catalog
netsh int ipv6 reset catalog
netsh int ip reset
echo Processed Successfully!
pause
goto Menu
:Cleartemp
cls
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
echo Processed Successfully!
echo ------------------------------------------------------------------------
echo Please restart the PC
echo ------------------------------------------------------------------------
pause
goto Menu
:rbst
set /p answer=Type y/n *** Y to shutdown or N to reboot and press ENTER KEY:
if %answer%==y goto stdw
if %answer%==n goto rbt
:stdw
shutdown -s -f
:rbt
shutdown -r -f
