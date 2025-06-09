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
