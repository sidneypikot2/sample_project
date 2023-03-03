# README

# Ruby version
  `3.2.0`
# Rails version
  `7.0.4.2 `
# Requirements
  `git`, `docker`, `docker-compose`

# Notable Gems
  `sidekiq`, `stimulus-rails`, `turbo-rails`, `fast_jsonapi`, `interactor`, `kaminari`, `tailwindcss-rails`, `rails-observers`

# Design Patterns
  `queries`, `services`, `serializers`, `presenters`, `observers`, `interactors`
# How to setup

  `Clone`

  * $ git clone https://github.com/sidneypikot2/sample_project.git

  `Build docker containers`

  * $ docker compose build

  `Start docker containers`

  * $ docker compose up -d

  `Setup database`

  * $ docker compose exec web rake db:setup db:migrate

  `Check logs`

  * $ docker compose exec web tail -f log/development.log

  `Stop docker container`

  * $ docker compose down

# Routes
  ## Uploading data
  * `curl --location --request POST 'localhost:3000/users/upload-data?limit=20&skip=0'`

  ## API's
  * `Index`
  * `GET 'localhost:3000/users?keyword=Davis Group&page=1&per_page=10'`
  * Sample Curl:
  ```
  curl --location 'localhost:3000/users?keyword=Davis%20Group&per_page=10&page=1'
  ```

  * `Show`
  * `GET 'localhost:3000/users/:id'`
  * Sample Curl:
  ```
  curl --location 'localhost:3000/users/153'
  ```

  * `Delete`
  * `Delete 'localhost:3000/users/destroy-multiple?ids=list_of_ids_separated_by_comma'`
  * Sample Curl:
  ```
  curl --location --request DELETE 'localhost:3000/users/destroy-multiple?ids=1%2C2%2C3%2C4'
  ```

  * `Put`
  * `No API details:TODO`

  * `Create`
  * `No API details:TODO`

  ## Web
  * `http://localhost:3000/users`

  ## Requirements
  * Fetch users data from the API endpoint and store it in the DB.
  * Use skip and limit params to paginate through resources.
  * Use a Worker to implement fetch logic, but for each page, call a new instance of the worker (meaning, process only one page in one instance of the worker and for the next page, enqueue another  worker until all records are processed).
  * Implement controller action to render HTML and JSON views for the User model
  * Implement logic to add/update/delete data from the views (bonus points for using Hotwire/Turbo)
  * Implement logic to select and delete multiple records at the same time.
  * Send an email to each deleted record 30 minutes after they have been deleted.
  * Cache the data for faster response times and purge the cache when a record is added or removed.
  * Add query params for pagination.
  * Make the views filterable by at least two filters of your choice (ie: gender and height)
  * Add tests (unit, integration, worker). Use your judgment to decide how complex tests should be. You can use RSpec or minitest.


  ## TODOS
  * Add validations to data on create/update
  * Pagination with Hotwire/Turbo
  * Update query params for pagination
  * Implement search with Hotwire/Turbo
  * Cache the data for faster response times and purge the cache when a record is added or removed.
  * Add tests (unit, integration, worker)
  * Feature to update table after deleting data
  * Clean Code
  * Update ReadME
  * ...