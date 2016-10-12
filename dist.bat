@echo off
set SCRIPTPATH=%~dp0
if exist "%SCRIPTPATH%\dist" goto rm
mkdir dist
:rm
if not exist "%SCRIPTPATH%\dist\dist.zip" goto zip
rm "%SCRIPTPATH%\dist\dist.zip"
:zip
zip -r "%SCRIPTPATH%\dist\dist.zip" app bin config db lib log public test vendor config.ru Gemfile Gemfile.lock Rakefile README.rdoc startup.bat
pause