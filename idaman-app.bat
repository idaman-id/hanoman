
ECHO OFF
ECHO "----------------------------------------"
ECHO "|    Running Idaman startup program    |"
ECHO "----------------------------------------"
ECHO "|             Contributor              |"
ECHO "|              @kokoraka               |"
ECHO "|                [...]                 |"
ECHO "----------------------------------------"
ECHO ----------------------------------------
ECHO A. DATABASE MONGODB
ECHO B. DATABASE MYSQL
ECHO C. DATASTORE PROMETHEUS
ECHO D. WEBSERVER APACHE
ECHO E. VISUALIZATION GRAFANA
ECHO F. MESSAGING RABBITMQ
ECHO ----------------------------------------
ECHO C0. D-MONGODB + D-MYSQL + W-APACHE
ECHO C1. W-MAIN + G-WEB + S-DOCUMENT + S-USER + S-NOTIFICATION + BLANK
ECHO ----------------------------------------
ECHO 0. BLANK [OK]
ECHO 1. WEBAPP MAIN [OK]

ECHO 21. GATEWAY WEB [OK]
ECHO 22. GATEWAY DOCUMENT [PHP]
ECHO 23. GATEWAY STORAGE [PHP]

ECHO 31. SERVICE DOCUMENT [OK]
ECHO 32. SERVICE FILE [PHP]
ECHO 33. SERVICE USER [X]
ECHO 34. SERVICE NOTIFICATION [X]
ECHO ----------------------------------------

SET /p menus="CHOOSE PROGRAMS TO RUN (comma separated): "
FOR %%i in ("%menus:,=" "%") do (
  ECHO ----------------------------------------
  ECHO Running: %%i please wait a moment..

  IF %%i=="C0" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"
    START "Database MySQL" CMD /k "cd /d D:\xampp && mysql_start.bat"
    START "Webserver Apache" CMD /k "cd /d D:\xampp && apache_start.bat"
  )
  IF %%i=="C1" (    
    START "Webapp Main" CMD /k "cd /d D:\startup\idaman\app\idaman-id && npm run dev"
    START "Gateway Web" CMD /k "cd /d D:\startup\idaman\gateway\gateway-web && npm run dev"
    START "Service Document" CMD /k "cd /d D:\startup\idaman\service\service-document && npm run dev"
    START "Blank" CMD /k "cd /d D:\startup\idaman\"
  )

  IF %%i=="A" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"
  )
  IF %%i=="B" (
    START "Database MySQL" CMD /k "cd /d D:\xampp && mysql_start.bat"
  )
  IF %%i=="C" (
    START "Datastore Prometheus" CMD /k "cd /d D:\prometheus\prometheus-2.21.0 && prometheus.exe"
  )
  IF %%i=="D" (
    START "Webserver Apache" CMD /k "cd /d D:\xampp && apache_start.bat"
  )
  IF %%i=="E" (
    START "Visualization Grafana" CMD /k "cd /d D:\grafana\grafana-7.3.7\bin && grafana-server.exe"
  )
  IF %%i=="F" (
    START "Messaging RabbitMQ" CMD /k "cd /d C:\Program Files\RabbitMQ Server\rabbitmq_server-3.8.11\sbin && rabbitmq-server start"
    @REM START "Messaging RabbitMQ Dashboard" CMD /k "cd /d C:\Program Files\RabbitMQ Server\rabbitmq_server-3.8.11\sbin && rabbitmq-plugins.bat enable rabbitmq_management"
  )
  
  IF %%i=="0" (
    START "Blank" CMD /k "cd /d D:\startup\idaman\"
  )
  IF %%i=="1" (
    START "Webapp Main" CMD /k "cd /d D:\startup\idaman\app\idaman-id && npm run dev"
  )
  IF %%i=="21" (
    START "Gateway Web" CMD /k "cd /d D:\startup\idaman\gateway\gateway-web && npm run dev"
  )

  IF %%i=="31" (
    START "Service Document" CMD /k "cd /d D:\startup\idaman\service\service-document && npm run dev"
    START "Service Document Test" CMD /k "cd /d D:\startup\idaman\service\service-document && npm run test-minimal"
  )

  ECHO Success running: %%i
  ECHO ----------------------------------------
)

ECHO Closing script.. please wait a moment..