@echo off
title Monitor de Ping

:: se nao recebeu parametros, esta na primeira execucao visivel
if "%~1"=="" goto :perguntar

:: se recebeu parametros, esta na execucao minimizada
goto :minimizado


:perguntar
mode con: cols=120 lines=50
echo ========================================
echo Digite os IPs que deseja EXCLUIR do monitoramento
echo Separados por espaco
echo Exemplo: 192.168.1.4 192.168.1.15
echo ========================================
set /p EXCLUIR_IPS="IPs para excluir: "

:: relanca o proprio script minimizado, passando os IPs digitados
start "Monitor de Ping" /min cmd /c ""%~f0" RUN %EXCLUIR_IPS%"
exit /b


:minimizado
mode con: cols=120 lines=50
setlocal enabledelayedexpansion
title Monitor de Ping

:: reconstrui a lista de IPs excluidos a partir dos parametros recebidos
shift
set "EXCLUIR_IPS=%*"

:: inicia o segundo .bat 30 segundos depois, apenas uma vez, em janela normal
start "Verifica Rede" cmd /c "timeout /t 30 /nobreak >nul & call C:\RafaelBarth\backup\Downloads\erros\verificaping.bat"
mode con: cols=120 lines=50

:: lista de IPs para ping
::set IP_LIST=8.8.8.8 192.168.1.4 192.168.1.15 192.168.1.16 192.168.1.23 192.168.1.34 192.168.1.35 192.168.1.43 192.168.1.45 192.168.1.56 192.168.1.58 192.168.1.80 192.168.1.84 192.168.1.87 192.168.1.93 192.168.1.101 192.168.1.105 192.168.1.106 192.168.1.107 192.168.1.113 192.168.1.208 192.168.1.214 192.168.1.217 192.168.1.218 192.168.1.222 192.168.1.223 192.168.1.224 192.168.1.225 192.168.1.226 192.168.1.228 192.168.1.232 192.168.1.234 192.168.1.235 192.168.1.236 192.168.1.237 192.168.1.238 192.168.1.239 192.168.1.240
set IP_LIST=8.8.8.8 192.168.1.4 192.168.1.15 192.168.1.16 192.168.1.23 192.168.1.34 192.168.1.35 192.168.1.43 192.168.1.45 192.168.1.56 192.168.1.58 192.168.1.80 192.168.1.84 192.168.1.87 192.168.1.93 192.168.1.101 192.168.1.105 192.168.1.106 192.168.1.107

echo ========================================
echo Monitor de Ping iniciado
echo Data: %date% Hora: %time%
echo IPs excluidos: %EXCLUIR_IPS%
echo Segundo script sera iniciado em 30 segundos
echo ========================================

:loopstart
echo ------------------------------------------------------------ >> log_ping.txt
echo Data: %date% e Hora: %time% >> log_ping.txt

for %%i in (%IP_LIST%) do (
    set "pingar=1"
    for %%e in (%EXCLUIR_IPS%) do (
        if "%%i"=="%%e" set "pingar=0"
    )
    if !pingar!==1 (
        ping %%i -n 1 >> log_ping.txt
    ) else (
        echo IP %%i ignorado (na lista de exclusao) >> log_ping.txt
    )
)

timeout /t 60 /nobreak >nul
goto loopstart