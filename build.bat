@echo off

set ROOT_DIR=%cd%
set BUILD_TARGET=%ROOT_DIR%\build\RenP5.pde
set BUILD_DIR=%ROOT_DIR%\Dev\

del %BUILD_TARGET%

cd %BUILD_DIR%

copy /b RenP5Core.pde+Sprite.pde+Scene.pde+Actor.pde+Dialogue.pde %BUILD_TARGET%

copy %BUILD_TARGET% "%ROOT_DIR%\Example01"

@pause