Сборка контейнера
```
docker-compose up -d --build
```

Установка Laravel:
После запуска контейнеров (см. ниже), зайди в контейнер app и установи Laravel:
```
docker-compose exec app bash
composer create-project laravel/laravel .
```

Laravel будет доступен по адресу: http://localhost:8080

При ошибке - Failed to open stream: Permission denied
1. Выдай права и владельца (в хостовой системе):
```
cd src
sudo chown -R $USER:www-data .
sudo find . -type f -exec chmod 664 {} \;
sudo find . -type d -exec chmod 775 {} \;
sudo chown -R www-data:www-data storage bootstrap/cache
```
2. Или (в контейнере app):
```
docker-compose exec app bash
chown -R www-data:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache
exit
```
