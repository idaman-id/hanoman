REM -- 
REM -- IDAMAN SHELL SCRIPT
REM -- WRITTEN BY:
REM -- 1. @kokoraka
REM --

ECHO OFF
ECHO Running Idaman startup program...

START "Webapp" /MIN CMD /c "cd /d D:\startup\idaman\app\idaman-id && npm run dev"
START "Gateway Web" /MIN CMD /c "cd /d D:\startup\idaman\service\endpoint\web && npm run dev"
START "Service User" /MIN CMD /c "cd /d D:\startup\idaman\service\user\user && npm run dev"
START "Service Preference" /MIN CMD /c "cd /d D:\startup\idaman\service\preference\preference && npm run dev"
START "Service Institution" /MIN CMD /c "cd /d D:\startup\idaman\service\institution\institution && npm run dev"
