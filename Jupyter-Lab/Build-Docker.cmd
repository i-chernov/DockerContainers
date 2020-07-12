@ECHO OFF

SETLOCAL
    SET image_name=jupyter-lab

    docker build --tag %image_name% .
ENDLOCAL