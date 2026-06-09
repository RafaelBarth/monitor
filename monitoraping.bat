@echo on

:loopstart
echo ------------------------------------------------------------ >> log_ping.txt
echo Data: %date% e Hora: %time% >> log_ping.txt
ping 8.8.8.8 -n 1 >> log_ping.txt
ping 192.168.1.4 -n 1 >> log_ping.txt
ping 192.168.1.15 -n 1 >> log_ping.txt
ping 192.168.1.16 -n 1 >> log_ping.txt
ping 192.168.1.23 -n 1 >> log_ping.txt
ping 192.168.1.34 -n 1 >> log_ping.txt
ping 192.168.1.35 -n 1 >> log_ping.txt
ping 192.168.1.43 -n 1 >> log_ping.txt
ping 192.168.1.45 -n 1 >> log_ping.txt
ping 192.168.1.56 -n 1 >> log_ping.txt
ping 192.168.1.58 -n 1 >> log_ping.txt
ping 192.168.1.80 -n 1 >> log_ping.txt
ping 192.168.1.84 -n 1 >> log_ping.txt
ping 192.168.1.87 -n 1 >> log_ping.txt
ping 192.168.1.93 -n 1 >> log_ping.txt
ping 192.168.1.101 -n 1 >> log_ping.txt
ping 192.168.1.105 -n 1 >> log_ping.txt
ping 192.168.1.106 -n 1 >> log_ping.txt
ping 192.168.1.107 -n 1 >> log_ping.txt
ping 192.168.1.113 -n 1 >> log_ping.txt
ping 192.168.1.208 -n 1 >> log_ping.txt
ping 192.168.1.214 -n 1 >> log_ping.txt
ping 192.168.1.217 -n 1 >> log_ping.txt
ping 192.168.1.218 -n 1 >> log_ping.txt
ping 192.168.1.222 -n 1 >> log_ping.txt
ping 192.168.1.223 -n 1 >> log_ping.txt
ping 192.168.1.224 -n 1 >> log_ping.txt
ping 192.168.1.225 -n 1 >> log_ping.txt
ping 192.168.1.226 -n 1 >> log_ping.txt
ping 192.168.1.228 -n 1 >> log_ping.txt
ping 192.168.1.232 -n 1 >> log_ping.txt
ping 192.168.1.234 -n 1 >> log_ping.txt
ping 192.168.1.235 -n 1 >> log_ping.txt
ping 192.168.1.236 -n 1 >> log_ping.txt
ping 192.168.1.237 -n 1 >> log_ping.txt
ping 192.168.1.238 -n 1 >> log_ping.txt
ping 192.168.1.239 -n 1 >> log_ping.txt
ping 192.168.1.240 -n 1 >> log_ping.txt

timeout -t 60
goto loopstart