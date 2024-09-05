import pysmb

# Crea un servidor SMB en el puerto 445
server = pysmb.SMBServer("localhost", 445)
# Comparte la carpeta `shared`
server.addShare("shared", "./")
# Inicia el servidor
server.start()
# Espera a que el servidor termine
server.join()
