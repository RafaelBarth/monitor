@echo off
mode con: cols=120 lines=50
setlocal enabledelayedexpansion

set IP_LIST=8.8.8.8 192.168.1.4 192.168.1.15 192.168.1.16 192.168.1.23 192.168.1.34 192.168.1.35 192.168.1.43 192.168.1.45 192.168.1.56 192.168.1.58 192.168.1.80 192.168.1.84 192.168.1.87 192.168.1.93 192.168.1.101 192.168.1.105 192.168.1.106 192.168.1.107 192.168.1.113 192.168.1.208 192.168.1.214 192.168.1.217 192.168.1.218 192.168.1.222 192.168.1.223 192.168.1.224 192.168.1.225 192.168.1.226 192.168.1.228 192.168.1.232 192.168.1.234 192.168.1.235 192.168.1.236 192.168.1.237 192.168.1.238 192.168.1.239 192.168.1.240

echo ========================================
echo Digite os IPs que deseja EXCLUIR (separados por espaco)
echo Exemplo: 192.168.1.4 192.168.1.15
echo Lista de IPs
echo "8.8.8.8": "Internet",
echo "192.168.1.4": "Camara2 - Giovane",
echo "192.168.1.15": "SERVIDOR",
echo "192.168.1.16": "Camara007 - Patrick",
echo "192.168.1.23": "Camara3 - PC",
echo "192.168.1.34": "Camara10 - Administração",
echo "192.168.1.35": "Camara005 - Tatiana",
echo "192.168.1.43": "Camara03 - Chines",
echo "192.168.1.45": "Camara008 - Gilvan",
echo "192.168.1.56": "Camara09 - Macedo",    
echo "192.168.1.58": "Camara006 - Rose",
echo "192.168.1.84": "Arquivo",
echo "192.168.1.87": "Camara01 - Wilson",
echo "192.168.1.88": "Camara002 - Paula",
echo "192.168.1.101": "Romeira",
echo "192.168.1.105": "Camara003 - Secretaria", 
echo "192.168.1.106": "Camara001 - Comissoes",
echo "192.168.1.107": "Camara004 - Financeiro",
echo "192.168.1.113": "Impressora - Wilson",
echo "192.168.1.208": "Impressora - Giovane",
echo "192.168.1.214": "Impressora - Administração",
echo "192.168.1.217": "Impressora - Comissoes",
echo "192.168.1.218": "Impressora - Claudio",
echo "192.168.1.222": "Impressora - Rose",
echo "192.168.1.223": "Impressora - Tatiana",
echo "192.168.1.224": "Impressora - Patrick",
echo "192.168.1.225": "Impressora - Gilvan",
echo "192.168.1.226": "Impressora - Esporinha",
echo "192.168.1.228": "Impressora - Wagner",
echo "192.168.1.232": "Impressora - Recepção",
echo "192.168.1.234": "Impressora - Secretaria",
echo "192.168.1.235": "Impressora - Adriano",
echo "192.168.1.236": "Impressora - PC",
echo "192.168.1.237": "Impressora - Rogerio",
echo "192.168.1.238": "Impressora - Arquivo",
echo "192.168.1.239": "Impressora - Financeiro",
echo "192.168.1.240": "Impressora - Paula",

echo ========================================
set /p EXCLUIR_IPS="IPs para excluir: "

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


timeout -t 60
goto loopstart

pause

:verifica


timeout /t 30 /nobreak >nul

:: Executa o segundo arquivo
call "C:\RafaelBarth\backup\Downloads\erros\verificaping.bat"

goto verifica

pause