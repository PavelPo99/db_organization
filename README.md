# The organization's publication database


## Возможности

- Типы публикаций:
  - Статьи в журналах
  - Главы книг 
  - Доклады
- CRUD для создания публикаций разных типов с указанным набором данных


## Стек

- Ruby on Rails 7
- PostgreSQL
- Bootstrap 5

## Установить зависимости
bundle install

# Настройка базы данных (для PostgreSQL)
```
Подключить .env
- USERNAME=your_username_db
- PASSWORD=your_passwort_db

rails db:create
rails db:migrate
rails db:seed
```
# Запустить сервер
```
rails server
```
