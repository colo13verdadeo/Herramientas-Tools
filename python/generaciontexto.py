import socket
import pdb

sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
host = '94.237.58.211'
port = 52718

try:
    print(str.encode('A'))
#    sock.connect((host, port))
#    sock.send(b'A' * 1000)
#    data = sock.recv(1024*4)
#    message = data.decode()
#    print(message)
#    print("Successfully sent data!")
# initializing string
    test_string = "GFG is best"

# printing original string
    print("The original string : " + str(test_string))

# Using bytes(str, enc)
# convert string to byte
    res = bytes(test_string, 'utf-8')

# print result
    print("The byte converted string is  : " + res + ", type : " + str(type(res)))
except socket.error:
    print("Error sending data.")
