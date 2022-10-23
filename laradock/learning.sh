#docker-compose exec workspace bash -c ""

#caching
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan config:cache"

#maintenance on
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan down"

#maintenance off
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan up"

# middleware
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan make:middleware AgeMiddleware"
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan make:middleware RoleMiddleware"
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan make:controller TestController"
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan make:middleware TerminateMiddleware"
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan make:controller ABCController"
sudo chmod -R 777 ../web/

# namespace
docker-compose exec workspace bash -c "cd project_tuan_learning && php artisan app:name SocialNet"
sudo chmod -R 777 ../web/



