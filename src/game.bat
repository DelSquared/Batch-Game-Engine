@echo off
::echo Welcome to the game!
::pause
cls

set dimX= 70
set dimY= 20

set wall= "#"
set floor= "."
set player= "@"
set enemy= "E"

set pX=35
set pY=10

set e1X=37
set e1Y=12

set e2X=38
set e2Y=11

set e3X=40
set e3Y=10

for /l %%i in (1, 1, 20) do (
   call :frame
)

pause

:frame
cls
graphics.exe "%dimX%" "%dimY%" "%pX%" "%pY%" "%e1X%" "%e1Y%" "%e2X%" "%e2Y%" "%e3X%" "%e3Y%"
set /a pX=pX-1
PING localhost -n 0.75 >NUL
