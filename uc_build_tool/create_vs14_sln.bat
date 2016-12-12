@SET path_cur=%~dp0
@SET arg1=%1
@SET path_build=build_vs14
@SET vs=Visual Studio 15

@REM Setup Visual Studio 14 Env For CMake...
@CALL "%VS140COMNTOOLS%..\..\VC\vcvarsall.bat"

@CD ..

@IF "%arg1%"=="x64" (
@SET path_build=%path_build%\x64
@SET platform="%vs% Win64"
) ELSE (
@SET path_build=%path_build%\Win32
@SET platform="%vs%"
)

@REM Create folder
@IF EXIST "%path_build%" (
@RD /S/Q "%path_build%"
)

@MD "%path_build%"
@CD "%path_build%"

@REM Exe cmake
@CALL cmake ../../ -G %platform% -DENABLE_WEBM_PARSER=ON -DCMAKE_BUILD_TYPE=release -DMSVC_RUNTIME=dll

@PAUSE
