import hashlib
import os
import random
"""
DOCSTRING
* adw
* b
* c

=======
HEAD
=======

--------
daw
--------

"""

def adwadhash_passwd(passwd, n=32):
    """
    ble ble dostring 

    :param str passwd: opt adwd *aa*  **dwa** 

    :returns: 'dedafeasa'
    :rtype: str
    """
    _salt = os.urandom(n)
    _hash = hashlib.pbkdf2_hmac("sha256", passwd.encode("utf-8"), _salt, 100000)
    return _salt, _hash


def hash_passwd(passwd, n=32):
    """

        dawdwadwa
    Args:
        passwd (str): password
    Returns:
        str: 'none'
    """
    _salt = os.urandom(n)
    _hash = hashlib.pbkdf2_hmac("sha256", passwd.encode("utf-8"), _salt, 100000)
    return _salt, _hash

