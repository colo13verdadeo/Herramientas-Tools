#!/usr/bin/env python

import os
import sys
from impacket.smbserver import SimpleSMBServer

def main():
    # Configuraciones del servidor SMB
    share_name = 'share'
    share_path = './share_folder'

    if not os.path.exists(share_path):
        os.makedirs(share_path)

    # Crear una instancia del servidor SMB
    server = SimpleSMBServer()
    server.setSMB2Support(True)  # Habilitar soporte para SMB2

    # Configurar el recurso compartido
    server.addShare(share_name, share_path)

    # Configurar permisos de usuario (esto permite acceso anónimo)
    server.setLogFile('smbserver.log')
#    server.addCredential(None, None, None)

    # Iniciar el servidor
    try:
        print(f"Iniciando servidor SMB compartiendo {share_path}")
        server.start()
    except Exception as e:
        print(f"Error al iniciar el servidor SMB: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()

