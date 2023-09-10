Show port running 
sudo lsof -i :<port_number>

Killing postgres port
sudo lsof -i :5432
sudo pkill -u postgres

Killing redis port
/etc/init.d/redis-server stop
/etc/init.d/redis-server start
