@echo off

set ROOT_DIR=%cd%
set BUILD_TARGET=%ROOT_DIR%\renP5.js
set BUILD_DIR=%ROOT_DIR%\js

del %BUILD_TARGET%

cd %BUILD_DIR%

copy /b renP5core.js+sprite.js+scene.js+actor.js+dialogue.js %BUILD_TARGET%

cd %ROOT_DIR%

copy %BUILD_TARGET% "..\example01\js"

@pause