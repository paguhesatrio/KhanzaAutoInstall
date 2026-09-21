@echo off
REM ============================================
REM  Map share ClientKhanza ke drive Y:
REM  Server : 172.16.17.222
REM  Share  : ClientKhanza
REM  User   : client
REM ============================================

REM Hapus mapping Y: lama kalau ada, supaya tidak bentrok
net use Y: /delete /y >nul 2>&1

REM Hubungkan drive Y: (akan minta password saat pertama kali)
net use Y: \\172.16.17.222\ClientKhanza /user:client /persistent:yes

if %errorlevel%==0 (
    echo.
    echo Drive Y: berhasil terhubung ke ClientKhanza.
) else (
    echo.
    echo GAGAL menghubungkan drive Y:.
    echo Periksa: jaringan / IP server / username / password.
)

echo.
pause
