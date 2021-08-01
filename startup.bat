ECHO OFF
ECHO "----------------------------------------"
ECHO "|           Running Hanoman            |"
ECHO "----------------------------------------"
ECHO "|             Contributor              |"
ECHO "|              @kokoraka               |"
ECHO "|                [...]                 |"
ECHO "----------------------------------------"
ECHO -----------------------------------------
ECHO (A) DATABASE MONGODB (DB-MONGODB)
ECHO (B) DATABASE MYSQL (DB-MYSQL)
ECHO (C) DATASTORE PROMETHEUS (DS-PROMETHEUS)
ECHO (D) WEBSERVER APACHE (WS-APACHE)
ECHO (E) VISUALIZATION GRAFANA (VS-GRAFANA)
ECHO (F) MESSAGING RABBITMQ (MG-RABBITMQ)
ECHO ----------------------------------------
ECHO (0) ROOT [open-dir]
ECHO (1) WEBAPP MAIN (WA-MAIN)
ECHO (21) GATEWAY MAIN (G-MAIN)
ECHO (22) GATEWAY DOCUMENT [open-url]
ECHO (23) GATEWAY STORAGE [open-url]
ECHO (31) SERVICE CORE (S-CORE)
ECHO ----------------------------------------
ECHO (C0) DB-MONGODB + DB-MYSQL + WS-APACHE
ECHO (C1) WA-MAIN + G-MAIN + S-CORE + ROOT
ECHO ----------------------------------------

SET /p menus="CHOOSE PROGRAMS TO RUN (comma separated): "
FOR %%m in ("%menus:,=" "%") do (
  ECHO ----------------------------------------
  ECHO Running: %%m please wait a moment..  

  IF %%m=="A" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"
  )
  IF %%m=="B" (
    START "Database MySQL" CMD /k "cd /d D:\xampp && mysql_start.bat"
  )
  IF %%m=="C" (
    START "Datastore Prometheus" CMD /k "cd /d D:\prometheus\prometheus-2.21.0 && prometheus.exe"
  )
  IF %%m=="D" (
    START "Webserver Apache" CMD /k "cd /d D:\xampp && apache_start.bat"
  )
  IF %%m=="E" (
    START "Visualization Grafana" CMD /k "cd /d D:\grafana\grafana-7.3.7\bin && grafana-server.exe"
  )
  IF %%m=="F" (
    START "Messaging RabbitMQ" CMD /k "cd /d C:\Program Files\RabbitMQ Server\rabbitmq_server-3.8.11\sbin && rabbitmq-server start"
    @REM START "Messaging RabbitMQ Dashboard" CMD /k "cd /d C:\Program Files\RabbitMQ Server\rabbitmq_server-3.8.11\sbin && rabbitmq-plugins.bat enable rabbitmq_management"
  )
  
  IF %%m=="0" (
    START "ROOT" CMD /k "cd /d D:\startup\idaman\"
  )
  IF %%m=="1" (
    START "Webapp Main" CMD /k "cd /d D:\startup\idaman\webapp\idaman-id && npm run dev"
  )
  IF %%m=="21" (
    START "Gateway Main" CMD /k "cd /d D:\startup\idaman\gateway\gateway-web && npm run dev"
  )
  IF %%m=="22" (
    START http://document.idaman.local
  )
  IF %%m=="23" (
    START http://storage.idaman.local
  )
  IF %%m=="31" (
    START "Service Core Dev" CMD /k "cd /d D:\startup\idaman\service\service-core && npm run start:dev"
    START "Service Core CLI" CMD /k "cd /d D:\startup\idaman\service\service-core"
    START "Service Core Test" CMD /k "cd /d D:\startup\idaman\service\service-core && npm run test:watch"
  )

  IF %%m=="C0" (
    START "Database MongoDB" CMD /k "cd /d D:\MongoDB\Server\4.4\bin && mongod --port 27017 --dbpath D:\MongoDB\Server\4.4\data --replSet rs0 --bind_ip localhost"
    START "Database MySQL" CMD /k "cd /d D:\xampp && mysql_start.bat"
    START "Webserver Apache" CMD /k "cd /d D:\xampp && apache_start.bat"
  )
  IF %%m=="C1" (    
    START "Webapp Main" CMD /k "cd /d D:\startup\idaman\webapp\idaman-id && npm run dev"
    START "Gateway Main" CMD /k "cd /d D:\startup\idaman\gateway\gateway-web && npm run dev"
    START "Service Core Dev" CMD /k "cd /d D:\startup\idaman\service\service-core && npm run start:dev"
    START "Service Core CLI" CMD /k "cd /d D:\startup\idaman\service\service-core"
    START "Service Core Test" CMD /k "cd /d D:\startup\idaman\service\service-core && npm run test:watch"
    START "Blank" CMD /k "cd /d D:\startup\idaman\"
  )

  ECHO Success running: %%m
  ECHO ----------------------------------------
)

ECHO Closing script.. please wait a moment..