::silly starting screen that could be commented out while debugging
@echo off
TITLE Game
echo Welcome to the game!
pause
cls

set dimX="70"
set dimY="20"
set ctrl="."

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

call :draw

::draw
:draw
   call :frame
   call :input
   

::frame-call
:frame
   cls
   graphics.exe %dimX% %dimY% %floor% %wall% %player% %enemy% %pX% %pY% %e1X% %e1Y% %e2X% %e2Y% %e3X% %e3Y%


::input
:input
   set /p ctrl= Enter command: 
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
