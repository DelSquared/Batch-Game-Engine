::silly starting screen that could be commented out while debugging
@echo off
TITLE Game
echo Welcome to the game!
pause
cls

set dimX=70
set dimY=20
set ctrl="."
set pts=0

::These are arguments for the C executable
set wall="#"
set floor="."
set player="@"
set enemy="E"

::keybinds
set up=w
set left=a
set down=s
set right=d

::player x,y (initialised at the centre of the canvas)
set /a pX=%dimX%/2
set /a pY=%dimY%/2

::enemies x,y (initialised randomly, in the future the initialisation will be a separate subroutine to respawn them)
set /a e1X=%random% %%(%dimX%-1) +1
set /a e1Y=%random% %%(%dimY%-1) +1

set /a e2X=%random% %%(%dimX%-1) +1
set /a e2Y=%random% %%(%dimY%-1) +1

set /a e3X=%random% %%(%dimX%-1) +1
set /a e3Y=%random% %%(%dimY%-1) +1

call :draw

::draw
:draw
   call :frame
   call :points
   call :input
   

::frame-call
:frame
   cls
   graphics.exe %dimX% %dimY% %floor% %wall% %player% %enemy% %pX% %pY% %e1X% %e1Y% %e2X% %e2Y% %e3X% %e3Y%

::display current points
:points
   echo Points: %pts%

::input
:input
   set /p ctrl= Enter command (pressing ENTER reuses last command): 
   call :process


::process controls
:process
if "%ctrl%"=="%up%" (
      call :moveUp
   ) else (
   if "%ctrl%"=="%left%" (
      call :moveLeft
   ) else (
   if "%ctrl%"=="%down%" (
      call :moveDown
   ) else (
   if "%ctrl%"=="%right%" (
      call :moveRight
   ))))


::keybind actions (there's a known bug here where the player can walk outside of the map)
:moveUp
   set /a pY=pY-1
   call :draw


:moveLeft
   set /a pX=pX-1
   call :draw


:moveDown
   set /a pY=pY+1
   call :draw


:moveRight
   set /a pX=pX+1
   call :draw
