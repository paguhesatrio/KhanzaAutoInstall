@echo off
REM ============================================================
REM  2. update.bat  (versi COPY - TANPA admin)
REM  INSTALASI PERTAMA: menyalin SEMUA file asli dari server
REM  ke D:\ClientKhanza (kalau tidak ada drive D -> C:\ClientKhanza).
REM  Jalankan sebagai USER BIASA (tidak perlu Run as admin).
REM ============================================================

set "SERVER=\\172.16.17.222\ClientKhanza"
set "SMBUSER=client"
set "SMBPASS=rsudpmk26"

REM --- Cek drive D: kalau ada pakai D, kalau tidak pakai C ---
set "TUJUAN=C:\ClientKhanza"
if exist "D:\" set "TUJUAN=D:\ClientKhanza"

echo Folder tujuan: %TUJUAN%
echo.

echo Menghubungkan ke server...
net use "%SERVER%" /user:%SMBUSER% %SMBPASS% /persistent:yes >nul 2>&1

echo Menyalin semua file aplikasi (file asli, bukan symlink)...
robocopy "%SERVER%" "%TUJUAN%" /E /COPY:DAT /DCOPY:DAT /R:1 /W:1

echo.
echo Selesai. Aplikasi ada di %TUJUAN%
pause