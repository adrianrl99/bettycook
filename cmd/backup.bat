@echo off
set project=bettycook
set app_name=bettycook
set release_path=F:\Releases\%project%\%app_name%\%branch%
set project_path=F:\Projects\%project%\%app_name%

set cmd="git branch --show-current"

FOR /F %%i IN (' %cmd% ') DO SET branch=%%i

if NOT exist %release_path% mkdir %release_path% 

flutter clean &^
flutter build apk --obfuscate --split-debug-info=./log &^
tar -czf %release_path%\%app_name%.code.tar.gz^
  -C %project_path%^
    --exclude .dart_tool^
    --exclude android/.gradle^
    --exclude build^
    --exclude %app_name%.code.tar.gz^
    --exclude app.*.map.json^
    --exclude app.*.symbols^
    --exclude lib/generated_plugin_registrant.dart^
    --exclude .packages^
    --exclude .flutter-plugins-dependencies^
    --exclude .flutter-plugins^
    . &^
copy "%project_path%\build\app\outputs\flutter-apk\app-release.apk" "%release_path%\%app_name%.apk"