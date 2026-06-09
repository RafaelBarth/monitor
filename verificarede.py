import re
import socket
import winsound
import os
import datetime
import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

# Dicionário com IPs e nomes da rede
nomes_rede = {
    "192.168.1.23": "Camara3 - PC",
    "192.168.1.45": "Camara008 - Gilvan",
    "192.168.1.15": "SERVIDOR",
    "192.168.1.43": "Camara03 - Chines",
    "192.168.1.88": "Camara002 - Paula",
    "192.168.1.34": "Camara10 - Administração",
    "192.168.1.35": "Camara005 - Tatiana",
    "192.168.1.58": "Camara006 - Rose",    
    "192.168.1.4": "Camara2 - Giovane",
    "192.168.1.87": "Camara01 - Wilson",
    "192.168.1.16": "Camara007 - Patrick",
    "192.168.1.56": "Camara09 - Macedo",
    "192.168.1.101": "Romeira",
    "192.168.1.105": "Camara003 - Secretaria", 
    "192.168.1.106": "Camara001 - Comissoes",
    "192.168.1.107": "Camara004 - Financeiro",
    "192.168.1.113": "Impressora - Wilson",
    "192.168.1.208": "Impressora - Giovane",
    "192.168.1.214": "Impressora - Administração",
    "192.168.1.217": "Impressora - Comissoes",
    "192.168.1.218": "Impressora - Claudio",
    "192.168.1.222": "Impressora - Rose",
    "192.168.1.223": "Impressora - Tatiana",
    "192.168.1.224": "Impressora - Patrick",
    "192.168.1.225": "Impressora - Gilvan",
    "192.168.1.226": "Impressora - Esporinha",
    "192.168.1.228": "Impressora - Wagner",
    "192.168.1.232": "Impressora - Recepção",
    "192.168.1.234": "Impressora - Secretaria",
    "192.168.1.235": "Impressora - Adriano",
    "192.168.1.236": "Impressora - PC",
    "192.168.1.237": "Impressora - Rogerio",
    "192.168.1.238": "Impressora - Arquivo",
    "192.168.1.239": "Impressora - Financeiro",
    "192.168.1.240": "Impressora - Paula",
    "192.168.1.9": "Impressora - Arquivo",
    "8.8.8.8": "Internet"
}

# Nome do arquivo que será lido
arquivo_entrada = "log_ping.txt"

def ler_arquivo_para_string(nome_arquivo):
  try:
    with open(nome_arquivo, 'r') as arquivo:
      conteudo = arquivo.read()
    return conteudo
  except FileNotFoundError:
    print(f"Erro: Arquivo não encontrado: {nome_arquivo}")
    return None
  except Exception as e:
    print(f"Ocorreu um erro ao ler o arquivo: {e}")
    return None

nome_do_arquivo = "momento_erro.txt"
texto_lido = ler_arquivo_para_string(nome_do_arquivo)
if texto_lido:
    print(f"Conteúdo do arquivo:\n{texto_lido}")

try:
    with open(arquivo_entrada, "r", encoding="latin-1") as entrada:
        linhas = entrada.readlines()

    palavra_alvo = "inacess¡vel"

    if not linhas:
        print("O arquivo está vazio.")
    else:
        encontrou = False
        for i in range(1, len(linhas)):
            linha_atual = linhas[i]
            if palavra_alvo.lower() in linha_atual.lower():
                linha_anterior = linhas[i - 1].strip()

                # Extrair IP da linha anterior
                match = re.search(r"\b\d{1,3}(?:\.\d{1,3}){3}\b", linha_anterior)
                if match:
                    ip = match.group()
                    nome_rede = nomes_rede.get(ip, "Nome desconhecido")

                    print("\nHost com Problema!")
                    print(f"IP encontrado     : {ip}")
                    print(f"Nome da rede      : {nome_rede}")
                    print(f"Linha anterior    : {linha_anterior}")
                    now = datetime.datetime.now()
                    data_hora_str = now.strftime("%d-%m-%Y %H:%M:%S")
                    with open("momento_erro.txt","a") as arquivo:
                        arquivo.write(data_hora_str + '\n')
                        arquivo.write(nome_rede + "\n")
                        arquivo.write("-------------------" + "\n")
                    winsound.Beep(800, 10)
                    winsound.Beep(1000, 10)
                    winsound.Beep(1200, 10)
                    winsound.Beep(1000, 10)
                    winsound.MessageBeep(winsound.MB_ICONEXCLAMATION)
                    os.remove("log_ping.txt")
                    print(f"Verificar Mensagem de Erro na tela.")
                        # Informações do remetente
                    email_remetente = 'rafaelbarth856@gmail.com'
                    senha = 'gjti ypao msws uibw'

                        # Informações do destinatário
                    email_destinatario = 'rafaelchina856@gmail.com'
                    assunto = 'Erro de Rede'
                    mensagem = nome_rede

                        # Monta o e-mail
                    msg = MIMEMultipart()
                    msg['From'] = email_remetente
                    msg['To'] = email_destinatario
                    msg['Subject'] = assunto
                    msg.attach(MIMEText(mensagem, 'plain'))

                        # Envia o e-mail
                    try:
                        with smtplib.SMTP('smtp.gmail.com', 587) as servidor:
                            servidor.starttls()
                            servidor.login(email_remetente, senha)
                            servidor.send_message(msg)
                        print('Email enviado com sucesso!')
                    except Exception as e:
                        print(f'Erro ao enviar email: {e}')

                else:
                    print("Nenhum IP encontrado na linha anterior.")

                encontrou = True
                #break

        if not encontrou:
            print(f" ")
            print(f"Rede OK!!!")
            remove = ("log_ping.txt")
            os.remove(remove)
            # winsound.Beep(420, 100)
            # winsound.MessageBeep(winsound.MB_OK)

except FileNotFoundError:
    print(f"Arquivo log_ping não encontrado, verifique se o arquivo monitoraping.bat esta executando!!!! ")
    winsound.Beep(400, 1000)
    winsound.MessageBeep(winsound.MB_OK)
except Exception as e:
    print(f"Ocorreu um erro: {e}")