echo y | sudo apt install net-tools # ifconfig
echo y | sudo apt-get install git
echo y | sudo apt-get install vim
echo y | sudo apt-get install yui-compressor
echo y | sudo apt-get install composer
echo y | sudo apt-get install curl
echo y | sudo apt-get install docker-compose
sudo sh -c 'echo "deb https://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
echo y | sudo apt-get install google-chrome-stable

sudo usermod -aG docker a
sudo git config --system core.longpaths true
sudo git config --global gui.encoding utf-8
sudo git config --global core.ignorecase false
sudo git config --global user.name "Tuan Nguyen"
sudo git config --global user.email "tuan.nguyen@brtchip.com"
sudo git config --system user.name "Tuan Nguyen"
sudo git config --system user.email "tuan.nguyen@brtchip.com"
sudo git config --system core.autocrlf input

# lavadock with apache2, mysql
cd ~/
mkdir laravel_docker_learn
cd laravel_docker_learn
git clone https://github.com/LaraDock/laradock.git
cd laradock
cp .env.example .env
sed -i 's/APP_CODE_PATH_HOST=../APP_CODE_PATH_HOST=..\/web/g' .env 
sed -ie 's/PHP_VERSION=[0-9.]*/PHP_VERSION=8.1/g' .env  # change this to php version in container
sed -ie 's/^MYSQL_PORT=[0-9.]*/MYSQL_PORT=33060/g' .env
#start docker
sudo docker-compose up -d apache2 mysql workspace phpmyadmin

docker-compose exec workspace bash -c 'composer create-project --prefer-dist laravel/laravel project_tuan_learning'
docker-compose exec workspace bash -c "chmod -R 777 project_tuan_learning"
docker-compose exec workspace bash -c "cd project_tuan_learning && sed -ie 's/DB_HOST=[0-9.a-zA-Z\"]*/DB_HOST=mysql/g' .env "
docker-compose exec workspace bash -c "cd project_tuan_learning && sed -ie 's/DB_DATABASE=[a-zA-Z\"]*/DB_DATABASE=default/g' .env"
docker-compose exec workspace bash -c "cd project_tuan_learning && sed -ie 's/DB_USERNAME=[a-zA-Z\"]*/DB_USERNAME=default/g' .env"
docker-compose exec workspace bash -c "cd project_tuan_learning && sed -ie 's/DB_PASSWORD=[a-zA-Z\"]*/DB_PASSWORD=secret/g' .env"

# docker-compose exec workspace bash # goto docker's workspace
    # composer create-project --prefer-dist laravel/laravel project_tuan_learning
    # chmod -R 777 project_tuan_learning
    # sed -ie 's/DB_HOST=[0-9.a-zA-Z\"]*/DB_HOST=mysql/g' .env 
    # sed -ie 's/DB_DATABASE=[a-zA-Z\"]*/DB_DATABASE=default/g' .env
    # sed -ie 's/DB_USERNAME=[a-zA-Z\"]*/DB_USERNAME=default/g' .env
    # sed -ie 's/DB_PASSWORD=[a-zA-Z\"]*/DB_PASSWORD=secret/g' .env

# now can access 127.0.0.1/project_tuan_learning/public on chrome
# now can access http://localhost:8081/ for phpmyadmin
# mysql connection can set at runtime
   