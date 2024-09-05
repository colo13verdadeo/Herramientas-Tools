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

    # Configurar el servidor
    server.setSMB2Support(False)  # Deshabilitar SMB2 para simplicidad

    # Configurar permisos de usuario (esto permite acceso de invitado)
    server.setGuestAccount('guest')

    # Iniciar el servidor
    try:
        print(f"Iniciando servidor SMB en {server_name}, compartiendo {share_path}")
        server.start()
    except Exception as e:
        print(f"Error al iniciar el servidor SMB: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

