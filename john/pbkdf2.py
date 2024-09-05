import hashlib
import base64

# Parámetros PBKDF2
password = b"97907280dc24fe517c43475bd218bfad56c25d4d11037d8b6da440efd4d691adfead40330b2aa6aaf1f33621d0d73228fc16"  # Debe ser un byte string
salt = base64.b64decode("227d873cca89103cd83a976bdac52486")  # Decodifica la sal de Base64 (equivale a "some_salt")
iterations = 50000  # Número de iteraciones
key_length = 50      # Longitud de la clave derivada en bytes

# Derivar la clave usando PBKDF2
derived_key = hashlib.pbkdf2_hmac('sha256', password, salt, iterations, dklen=key_length)
derived_key_base64 = base64.b64encode(derived_key).decode('utf-8')

print(f"Derived Key (Base64): {derived_key_base64}")

