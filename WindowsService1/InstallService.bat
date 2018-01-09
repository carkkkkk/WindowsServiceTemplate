@echo off

REM DEFINIÇÃO DE VARIÁVEIS: Não utilizar espaços entre o nome da variável e o valor recebido
SET NomeSistema=Service One
SET NomeExe=WindowsService1.exe

echo ##############################################################
echo.
echo        Instalador %NomeSistema%
echo.
echo ##############################################################
echo.
echo.

REM --- O Comando[ %~dp0 ] obtem o path do arquivo bat

SET Path="%~dp0%NomeExe%"

:escolhePath
SET /p Path=Digite o caminho do executavel ou digite [Enter] para: "%NomeExe%":

IF NOT EXIST %Path% (
	echo --------- Digite o caminho e nome de um arquivo valido
	echo.
	GOTO escolhePath
)

echo.

echo ##############################################################
echo.
echo Arquivo do servico: %Path%
echo.
echo ##############################################################
echo.
SET /p Choice=Confirma a configuracao acima? [Y/N]:

REM --- Testa se foi digitado y ou Y -------------------------
IF "%Choice%" == "y" GOTO instalaServico
IF "%Choice%" == "Y" GOTO instalaServico
echo.
echo.
GOTO escolhePath
REM -----------------------------------------------------------


:instalaServico

call C:\Windows\System32\SC.exe create "%NomeSistema%" binPath= """%Path%""" DisplayName= "%NomeSistema%"
echo.
echo.

pause