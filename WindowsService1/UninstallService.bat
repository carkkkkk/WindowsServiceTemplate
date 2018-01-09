@echo off 

REM DEFINIÇÃO DE VARIÁVEIS: Não utilizar espaços entre o nome da variável e o valor recebido
SET NomeSistema=Service One

echo ##############################################################
echo.
echo        Desisntalador %NomeSistema%
echo.
echo ##############################################################
echo.
echo.

echo.

SET /p Choice=Confirma a desinstalacao? [Y/N]:

REM --- Testa se foi digitado y ou Y -------------------------
IF "%Choice%" == "y" GOTO instalaServico
IF "%Choice%" == "Y" GOTO instalaServico
echo.
echo.
GOTO escolhePath
REM -----------------------------------------------------------


:instalaServico

call C:\Windows\System32\SC.exe delete "%NomeSistema%"
echo.
echo.


pause