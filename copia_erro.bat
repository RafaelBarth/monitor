@echo on
:loopstart
robocopy C:\RafaelBarth\backup\Downloads\erros  \\192.168.1.15\publico\erros\ momento_erro.txt
timeout -t 60
goto loopstart