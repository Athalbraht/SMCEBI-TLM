import hashlib
import os
import random
"""
DOCSTRING
"""


def haash_passwd(passwd, n=32):
    """

        dawdwadwa

    Parameters:
    :passwd: password
    :type: passwd: str
    Returns:
        :: None
    """
    _salt = os.urandom(n)
    _hash = hashlib.pbkdf2_hmac("sha256", passwd.encode("utf-8"), _salt, 100000)
    return _salt, _hash

