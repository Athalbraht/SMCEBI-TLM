from setuptools import setup

setup(
    name="Verify-SMCEBI",
    description="calc hash",
    version="v0.1",
    author="Albert Szadziński",
    author_email="dwdwa@gmail.com",
    licence="MIT",
    packages=['Verify'],
    entry_points={
        'console_scripts' : ['verify = Verify.main:main']
    }
)


