sudo docker pull mysql
#https://github.com/bitnami/bitnami-docker-magento
sudo docker network create magento-tier
sudo docker volume create --name mariadb_data
sudo docker run -d --name mariadb -e ALLOW_EMPTY_PASSWORD=yes -e MARIADB_USER=bn_magento -e MARIADB_PASSWORD=your_password -e MARIADB_DATABASE=bitnami_magento --net magento-tier --volume mariadb_data:/bitnami bitnami/mariadb:latest
sudo docker volume create --name magento_data
sudo docker run -d --name magento -p 80:80 -p 443:443 -e MAGENTO_DATABASE_USER=bn_magento -e MAGENTO_DATABASE_PASSWORD=your_password -e MAGENTO_DATABASE_NAME=bitnami_magento --net magento-tier --volume magento_data:/bitnami bitnami/magento:latest
