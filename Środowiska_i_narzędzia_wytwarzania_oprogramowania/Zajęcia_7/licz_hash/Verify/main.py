from Verify import hash_passwd
import click

"""
its main.py::
    def xwa():
        pass
ble

.. code-block: python
    def q():
        pass

xD


"""

@click.command()
@click.option("--passwd", help="your password", prompt="Your password")
def main(passwd):
    """
    moja finkcja main

    Parameters
    ------------------
    passwd: str
        twoje haslo 
    Returns
    ------------
    None
        nic
    
    """
    _salt, _hash = hash_passwd(passwd)
    print(f"salt={_salt}\nhash={_hash}")
    return None

if __name__ == "__main__":
    main()
