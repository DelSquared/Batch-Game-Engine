@echo off
echo Welcome to the game!
pause
cls

set dimX= 70
set dimY= 20

::These will be implemented in the C executable in the future but currently not
set wall= "#"
set floor= "."
set player= "@"
set enemy= "E"

::player x,y
set pX=35
set pY=10

::enemies x,y
set e1X=37
set e1Y=12

set e2X=38
set e2Y=11

set e3X=40
set e3Y=10

::draw-loop
for /l %%i in (1, 1, 20) do (
      call :frame
      PING localhost -n 0.75 >NUL
)

pause

::frame-call subroutine
:frame
      cls
      graphics.exe "%dimX%" "%dimY%" "%pX%" "%pY%" "%e1X%" "%e1Y%" "%e2X%" "%e2Y%" "%e3X%" "%e3Y%"
      ::example movement for demonstration
      set /a pX=pX-1
