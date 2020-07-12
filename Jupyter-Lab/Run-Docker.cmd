@ECHO OFF

SETLOCAL
    SET name=--name jupyter  
    SET image=jupyter-lab

    REM SET flags=--interactive

    docker run %name% %flags% %image%
ENDLOCAL