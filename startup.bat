@echo off
set SCRIPTPATH=%~dp0
ruby %SCRIPTPATH%\bin\bundle install
ruby %SCRIPTPATH%\bin\rake db:create db:migrate
ruby %SCRIPTPATH%\bin\rails server