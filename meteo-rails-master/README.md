### Configuration
rename .env_example in .env

Get a API KEY from openweathermap.org:

https://openweathermap.org



========= NGINX ===================
```
docker run --name docker-nginx -p 80:80 -v /home/docker/nginx-config/default.conf:/etc/nginx/conf.d/default.conf -d nginx
```

======== JENKINS =================
```
docker run --name myjenkins -p 8081:8080 -p 50000:50000 -v /var/jenkins_home jenkins
```
```
docker start myjenkins
```
http://137.74.172.50:8081

user: xxxx

password: xxxx

email: xxxx

======= RAILS =============
```
cd /home/docker/meteo-rails/
```
```
docker-compose build
```
```
docker-compose up -d
```
```
http://137.74.172.50:3000
```


```
CONTAINER ID        IMAGE                   COMMAND                  CREATED             STATUS              PORTS                                              NAMES
0ba303977946        meteorails_app          "bundle exec puma ..."   17 seconds ago      Up 15 seconds       0.0.0.0:3000->3000/tcp                             meteorails_app_1
43ac5995b411        phpmyadmin/phpmyadmin   "/run.sh phpmyadmin"     17 seconds ago      Up 16 seconds       0.0.0.0:8082->80/tcp                               meteorails_phpmyadmin_1
b10324f80781        mysql                   "docker-entrypoint..."   17 seconds ago      Up 16 seconds       0.0.0.0:3306->3306/tcp                             meteorails_db_1
2f4fe36c0646        jenkins                 "/bin/tini -- /usr..."   3 hours ago         Up 3 hours          0.0.0.0:50000->50000/tcp, 0.0.0.0:8081->8080/tcp   myjenkins
0c7f4ce51e0e        nginx                   "nginx -g 'daemon ..."   3 weeks ago         Up 3 weeks          0.0.0.0:80->80/tcp, 443/tcp                        docker-nginx
```

