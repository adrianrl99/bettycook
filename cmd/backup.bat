@echo off
set name=bettycook

set cmd="git branch --show-current"

FOR /F %%i IN (' %cmd% ') DO SET branch=%%i

if NOT exist F:\Releases\%name%\%branch% mkdir F:\Releases\%name%\%branch%

tar -czf F:\Releases\%name%\%branch%\%name%.code.tar.gz^
 -C F:\Projects\%name%^
  --exclude .dart_tool^
  --exclude android/.gradle^
  --exclude build^
  --exclude %name%.code.tar.gz^
  --exclude app.*.map.json^
  --exclude app.*.symbols^
  --exclude lib/generated_plugin_registrant.dart^
  --exclude .packages^
  --exclude .flutter-plugins-dependencies^
  --exclude .flutter-plugins^
  .

if exist "F:\Projects\%name%\build\app\outputs\flutter-apk\app-release.apk" copy "F:\Projects\%name%\build\app\outputs\flutter-apk\app-release.apk" F:\Releases\%name%\%branch%\%name%.apk