@echo on

:loopstart

python verificarede.py
timeout -t 60

goto loopstart