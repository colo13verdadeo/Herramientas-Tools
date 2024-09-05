import hashlib
import base64

password = b"97907280dc24fe517c43475bd218bfad56c25d4d11037d8b6da440efd4d691adfead40330b2aa6aaf1f33621d0d73228fc16"
salt = bytes.fromhex("227d873cca89103cd83a976bdac52486")
iterations = 50000
key_length = 50
derived_key = hashlib.pbkdf2_hmac('sha256', password, salt, iterations, dklen=key_length)
derived_key_base64 = base64.b64encode(derived_key).decode('utf-8')

print(f"Key: {derived_key}")
print(f"(Base64): {derived_key_base64}")
