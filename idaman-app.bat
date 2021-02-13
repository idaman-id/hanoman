
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
ECHO B. DATABASE PROMETHEUS
ECHO C. VISUALIZATION GRAFANA
ECHO D. MESSAGING RABBITMQ
ECHO ----------------------------------------
ECHO C1. MONGODB + WEBAPP MAIN + GATEWAY WEB, DOCUMENT + SERVICE INSTITUTION, PREFERENCE, USER, MERCHANT, PAYMENT
ECHO C2. MONGODB + GATEWAY ANDROID + SERVICE INSTITUTION, PREFERENCE, USER
ECHO ----------------------------------------
ECHO 1. WEBAPP MAIN

ECHO 21. GATEWAY WEB
ECHO 22. GATEWAY ANDROID
ECHO 23. GATEWAY PAYMENT
ECHO 24. GATEWAY DOCUMENT

ECHO 31. SERVICE INSTITUTION
ECHO 32. SERVICE MERCHANT
ECHO 33. SERVICE PAYMENT
ECHO 34. SERVICE PREFERENCE
ECHO 35. SERVICE SEARCH
ECHO 36. SERVICE USER
ECHO 37. SERVICE NOTIFICATION SYSTEM
ECHO ----------------------------------------

SET /p menus="CHOOSE PROGRAMS TO RUN (comma separated): "
FOR %%i in ("%menus:,=" "%") do (
  ECHO ----------------------------------------
  ECHO Running: %%i please wait a moment..
  IF %%i=="C1" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"
    START "Webapp Idaman.ID" CMD /k "cd /d D:\startup\idaman\app\idaman-id && npm run dev"
    START "Gateway Web" CMD /k "cd /d D:\startup\idaman\service\endpoint\web && npm run dev"
    START "Gateway Document" CMD /k "cd /d D:\startup\idaman\service\endpoint\document && npm run dev"
    START "Service Institution" CMD /k "cd /d D:\startup\idaman\service\institution\institution && npm run dev"
    START "Service Preference" CMD /k "cd /d D:\startup\idaman\service\preference\preference && npm run dev"
    START "Service User" CMD /k "cd /d D:\startup\idaman\service\user\user && npm run dev"
    START "Service Merchant" CMD /k "cd /d D:\startup\idaman\service\merchant\merchant && npm run dev"

    START "Service Payment" CMD /k "cd /d D:\startup\idaman\service\payment\payment && npm run dev"
    START "Service Payment Test" CMD /k "cd /d D:\startup\idaman\service\payment\payment && npm run test-minimal"
  )
  IF %%i=="C2" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"
    START "Gateway Android" CMD /k "cd /d D:\startup\idaman\service\endpoint\android && npm run dev"
    START "Service Institution" CMD /k "cd /d D:\startup\idaman\service\institution\institution && npm run dev"
    START "Service Preference" CMD /k "cd /d D:\startup\idaman\service\preference\preference && npm run dev"
    START "Service User" CMD /k "cd /d D:\startup\idaman\service\user\user && npm run dev"
  )

  IF %%i=="A" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"
  )
  IF %%i=="B" (
    START "Database Prometheus" CMD /k "cd /d D:\prometheus\prometheus-2.21.0 && prometheus.exe"
  )
  IF %%i=="C" (
    START "Visualization Grafana" CMD /k "cd /d D:\grafana\grafana-7.3.7\bin && grafana-server.exe"
  )
  IF %%i=="D" (
    START "Messaging RabbitMQ" CMD /k "cd /d C:\Program Files\RabbitMQ Server\rabbitmq_server-3.8.11\sbin && rabbitmq-server start"
    START "Messaging RabbitMQ Dashboard" CMD /k "cd /d C:\Program Files\RabbitMQ Server\rabbitmq_server-3.8.11\sbin && rabbitmq-plugins.bat enable rabbitmq_management"
  )
  IF %%i=="1" (
    START "Webapp Idaman.ID" CMD /k "cd /d D:\startup\idaman\app\idaman-id && npm run dev"
  )

  IF %%i=="21" (
    START "Gateway Web" CMD /k "cd /d D:\startup\idaman\service\endpoint\web && npm run dev"
  )
  IF %%i=="22" (
    START "Gateway Android" CMD /k "cd /d D:\startup\idaman\service\endpoint\android && npm run dev"
  )
  IF %%i=="23" (
    START "Gateway Payment" CMD /k "cd /d D:\startup\idaman\service\endpoint\payment && npm run dev"
  )
  IF %%i=="24" (
    START "Gateway Document" CMD /k "cd /d D:\startup\idaman\service\endpoint\document && npm run dev"
  )

  IF %%i=="31" (
    START "Service Institution" CMD /k "cd /d D:\startup\idaman\service\institution\institution && npm run dev"
  )
  IF %%i=="32" (
    START "Service Merchant" CMD /k "cd /d D:\startup\idaman\service\merchant\merchant && npm run dev"
  )
  IF %%i=="33" (
    START "Service Payment" CMD /k "cd /d D:\startup\idaman\service\payment\payment && npm run dev"
    START "Service Payment Test" CMD /k "cd /d D:\startup\idaman\service\payment\payment && npm run test-minimal"
  )
  IF %%i=="34" (
    START "Service Preference" CMD /k "cd /d D:\startup\idaman\service\preference\preference && npm run dev"
  )
  IF %%i=="35" (
    START "Service Search" CMD /k "cd /d D:\startup\idaman\service\preference\search && npm run dev"
  )
  IF %%i=="36" (
    START "Service User" CMD /k "cd /d D:\startup\idaman\service\user\user && npm run dev"
  )
  IF %%i=="37" (
    START "Service Notification System" CMD /k "cd /d D:\startup\idaman\service\notification\system && npm run dev"
  )

  ECHO Success running: %%i
  ECHO ----------------------------------------
)

ECHO Closing script.. please wait a moment..