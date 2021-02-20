
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
ECHO C1. MONGODB + WEBAPP MAIN + GATEWAY WEB, DOCUMENT + SERVICE INSTITUTION, PREFERENCE, USER, PAYMENT
ECHO C2. MONGODB + GATEWAY ANDROID + SERVICE INSTITUTION, PREFERENCE, USER
ECHO ----------------------------------------
ECHO 1. WEBAPP MAIN

ECHO 21. GATEWAY WEB
ECHO 22. GATEWAY ANDROID
ECHO 23. GATEWAY PAYMENT
ECHO 24. GATEWAY DOCUMENT (LINK)
ECHO 25. GATEWAY NOTIFICATION (LINK)
ECHO 26. GATEWAY STORAGE (LINK)
ECHO 27. GATEWAY STORAGE SERVANT (LINK)

ECHO 31. SERVICE INSTITUTION
ECHO 32. SERVICE PAYMENT
ECHO 33. SERVICE PREFERENCE
ECHO 34. SERVICE REVIEW
ECHO 35. SERVICE SYSTEM NOTIFICATION
ECHO 36. SERVICE SYSTEM STORAGE (LINK)
ECHO 37. SERVICE USER

ECHO XX. SERVICE MEETING (DISABLED)
ECHO XX. SERVICE LOG (DISABLED)
ECHO XX. SERVICE SEARCH (DISABLED)
ECHO XX. SERVICE MERCHANT (DISABLED)
ECHO ----------------------------------------

SET /p menus="CHOOSE PROGRAMS TO RUN (comma separated): "
FOR %%i in ("%menus:,=" "%") do (
  ECHO ----------------------------------------
  ECHO Running: %%i please wait a moment..
  IF %%i=="C1" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"
    START "Webapp Idaman.ID" CMD /k "cd /d D:\startup\idaman\app\idaman-id && npm run dev"

    START "Gateway Web" CMD /k "cd /d D:\startup\idaman\gateway\gateway-web && npm run dev"
    START "Service Institution" CMD /k "cd /d D:\startup\idaman\service\service-institution && npm run dev"
    START "Service Preference" CMD /k "cd /d D:\startup\idaman\service\service-preference && npm run dev"
    START "Service User" CMD /k "cd /d D:\startup\idaman\service\service-user && npm run dev"
    START "Service Payment" CMD /k "cd /d D:\startup\idaman\service\service-payment && npm run dev"
  )
  IF %%i=="C2" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"

    START "Gateway Android" CMD /k "cd /d D:\startup\idaman\gateway\gateway-android && npm run dev"
    START "Service Institution" CMD /k "cd /d D:\startup\idaman\service\service-institution && npm run dev"
    START "Service Preference" CMD /k "cd /d D:\startup\idaman\service\service-preference && npm run dev"
    START "Service User" CMD /k "cd /d D:\startup\idaman\service\service-user && npm run dev"
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
    START "Gateway Web" CMD /k "cd /d D:\startup\idaman\gateway\gateway-web && npm run dev"
  )
  IF %%i=="22" (
    START "Gateway Android" CMD /k "cd /d D:\startup\idaman\gateway\gateway-android && npm run dev"
  )
  IF %%i=="23" (
    START "Gateway Payment" CMD /k "cd /d D:\startup\idaman\gateway\gateway-payment && npm run dev"
  )
  IF %%i=="24" (
    START "Gateway Document" CMD /k "cd /d D:\startup\idaman\gateway\gateway-document"
    START "Gateway Document Test" CMD /k "cd /d D:\startup\idaman\gateway\gateway-document & composer test"
  )
  IF %%i=="25" (
    START "Gateway Notification" CMD /k "cd /d D:\startup\idaman\gateway\gateway-notification"
    START "Gateway Notification Test" CMD /k "cd /d D:\startup\idaman\gateway\gateway-notification & composer test"
  )
  IF %%i=="26" (
    START "Gateway Storage" CMD /k "cd /d D:\startup\idaman\gateway\gateway-storage"
    START "Gateway Storage Test" CMD /k "cd /d D:\startup\idaman\gateway\gateway-storage & composer test"
  )
  IF %%i=="27" (
    START "Gateway Storage Servant" CMD /k "cd /d D:\startup\idaman\gateway\gateway-storage-servant"
    START "Gateway Storage Servant Test" CMD /k "cd /d D:\startup\idaman\gateway\gateway-storage-servant & composer test"
  )



  IF %%i=="31" (
    START "Service Institution" CMD /k "cd /d D:\startup\idaman\service\service-institution && npm run dev"
    START "Service Institution Test" CMD /k "cd /d D:\startup\idaman\service\service-institution && npm run test-minimal"
  )
  IF %%i=="32" (
    START "Service Payment" CMD /k "cd /d D:\startup\idaman\service\service-payment && npm run dev"
    START "Service Payment Test" CMD /k "cd /d D:\startup\idaman\service\service-payment && npm run test-minimal"
  )
  IF %%i=="33" (
    START "Service Preference" CMD /k "cd /d D:\startup\idaman\service\service-preference && npm run dev"
    START "Service Preference Test" CMD /k "cd /d D:\startup\idaman\service\service-preference && npm run test-minimal"
  )
  IF %%i=="34" (
    START "Service Review" CMD /k "cd /d D:\startup\idaman\service\service-review && npm run dev"
    START "Service Review Test" CMD /k "cd /d D:\startup\idaman\service\service-review && npm run test-minimal"
  )
  IF %%i=="35" (
    START "Service System Notification" CMD /k "cd /d D:\startup\idaman\service\service-system-notification && npm run dev"
    START "Service System Notification Test" CMD /k "cd /d D:\startup\idaman\service\service-system-notification && npm run test-minimal"
  )
  IF %%i=="36" (
    START "Service System Storage" CMD /k "cd /d D:\startup\idaman\service\service-system-storage"
    START "Service System Storage Test" CMD /k "cd /d D:\startup\idaman\service\service-system-storage & composer test"
  )
  IF %%i=="37" (
    START "Service User" CMD /k "cd /d D:\startup\idaman\service\service-user && npm run dev"
    START "Service User Test" CMD /k "cd /d D:\startup\idaman\service\service-user && npm run test-minimal"
  )



  ECHO Success running: %%i
  ECHO ----------------------------------------
)

ECHO Closing script.. please wait a moment..