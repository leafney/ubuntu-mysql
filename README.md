Ubuntu-16.04 + Mysql-5.7

#### ENVPOINT

* `MYSQL_ROOT_PWD` : root password   default "mysql"
* `MYSQL_USER`  : new user
* `MYSQL_USER_PWD` : new user password

#### build image

```
$ docker build -t="leafney/ubuntu-mysql" .
```

#### run a default contaier

```
$ docker run --name mysql -v /var/docker_data/mysql/data/:/var/lib/mysql -d -p 3306:3306 leafney/ubuntu-mysql
```

#### run a container

```
docker run --name mysql -v /var/docker_data/mysql/data/:/var/lib/mysql -d -p 3306:3306 -e MYSQL_ROOT_PWD=123 -e MYSQL_USER=dev -e MYSQL_USER_PWD=dev leafney/ubuntu-mysql
```
