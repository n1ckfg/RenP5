@echo off

set ROOT_DIR=%cd%
set BUILD_TARGET=%ROOT_DIR%\build\renP5.js
set BUILD_DIR=%ROOT_DIR%\dev\js

del %BUILD_TARGET%

cd %BUILD_DIR%

copy /b renP5core.js+sprite.js+scene.js+actor.js+dialogue.js %BUILD_TARGET%

copy %BUILD_TARGET% "%ROOT_DIR%\example01\js"

@pause