#!/usr/bin/env python

import os
import sys
from impacket.smbserver import SimpleSMBServer

def main():
    # Configuraciones del servidor SMB
    server_name = 'SMBServer'
    share_name = 'share'
    share_path = './share_folder'

    if not os.path.exists(share_path):
        os.makedirs(share_path)

    # Crear una instancia del servidor SMB
    server = SimpleSMBServer(listenAddress='0.0.0.0', listenPort=445)

    # Configurar el recurso compartido
    server.addShare(share_name, share_path)

    # Configurar usuarios (opcional)
    # server.setSMB2Support(True)
    server.setSMB2Support(False)  # SMB2 deshabilitado para simplicidad
    server.addUser('guest', '', 'Guest')

    # Iniciar el servidor
    try:
        print(f"Iniciando servidor SMB en {server_name}, compartiendo {share_path}")
        server.start()
    except Exception as e:
        print(f"Error al iniciar el servidor SMB: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

