import os
from smbprotocol.server import SMBServer
from smbprotocol.connection import Connection
from smbprotocol.session import Session
from smbprotocol.tree import TreeConnect
from smbprotocol.open import Open, CreateDisposition
from smbprotocol.file_info import FileAttributes, FileInformationClass

# Configuraciones del servidor
server_name = 'localhost'
server_ip = '0.0.0.0'
share_name = 'share'
share_path = './share_folder'

if not os.path.exists(share_path):
    os.makedirs(share_path)

def handle_request(request, response, conn, session, tree, file):
    file_path = os.path.join(share_path, file.name)
    if request.oplock_level is not None:
        response.oplock_level = request.oplock_level
    
    if request.create_disposition == CreateDisposition.FILE_OPEN:
        if os.path.exists(file_path):
            response.create_disposition = CreateDisposition.FILE_OPEN
            response.file_attributes = FileAttributes.FILE_ATTRIBUTE_NORMAL
            response.allocation_size = os.path.getsize(file_path)
        else:
            response.status = NTStatus.STATUS_OBJECT_NAME_NOT_FOUND
    else:
        with open(file_path, 'wb') as f:
            f.write(request.data)
        response.create_disposition = CreateDisposition.FILE_OVERWRITE_IF
        response.file_attributes = FileAttributes.FILE_ATTRIBUTE_NORMAL
        response.allocation_size = len(request.data)
    return response

# Crear el servidor SMB
server = SMBServer(server_name, server_ip)

# Manejar conexiones entrantes
@server.connection_handler
def handle_connection(conn: Connection):
    conn.accept()

@server.session_handler
def handle_session(conn: Connection, session: Session):
    session.accept()

@server.tree_connect_handler
def handle_tree_connect(conn: Connection, session: Session, tree: TreeConnect):
    tree.accept(share_name)

@server.open_handler
def handle_open(conn: Connection, session: Session, tree: TreeConnect, file: Open):
    return handle_request

# Iniciar el servidor
print(f"Iniciando servidor SMB en {server_ip}")
server.start()

