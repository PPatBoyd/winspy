@echo off

SET vcvars="%VS140COMNTOOLS%\..\..\VC\vcvarsall.bat"
SET version_h=".\version.h"
SET resource_rc="..\src\resource\WinSpy.rc"

REM update the version build count, and 
REM the resource-file prior to building the solution
incbuild.rb %version_h% %resource_rc%

REM path to the visual-studio commandline environment variables

REM spawn another shell and run 'build0' with the VCVARS
%comspec% /c "%vcvars% x86_amd64 && build0.bat"

REM package everything together
buildzip.rb x86
buildzip.rb amd64

