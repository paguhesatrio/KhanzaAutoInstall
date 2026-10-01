@echo off
cd /d %TEMP%
curl -L -o %TEMP%\khanza.zip https://github.com/paguhesatrio/KhanzaAutoInstall/archive/refs/heads/main.zip || (echo Download gagal & pause & exit /b)
tar -xf %TEMP%\khanza.zip -C C:\ || (echo Extract gagal & pause & exit /b)
if exist C:\KhanzaAutoInstall rmdir /s /q C:\KhanzaAutoInstall
ren C:\KhanzaAutoInstall-main KhanzaAutoInstall
del %TEMP%\khanza.zip
cd /d C:\KhanzaAutoInstall
call "1. Map_ClientKhanza.bat"
call "2. update.bat"
call "3. finalisasi-khanza.bat"
call "update-khanza.bat"