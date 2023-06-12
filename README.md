## What will we build
We will convert a multi-page chat app into a single page app in 6 steps with __no Javascript__

- [Part 1 - New Message With Turbo Frame](https://github.com/scottmascio2115/demo-turbo-chat/pull/3)
- [Part 2 - Edit Using Turbo Frame](https://github.com/scottmascio2115/demo-turbo-chat/pull/4)
- [Part 3 - Delete Using Turbo Streams](https://github.com/scottmascio2115/demo-turbo-chat/pull/5)
- [Part 4 - New Message With Turbo Streams](https://github.com/scottmascio2115/demo-turbo-chat/pull/6)
- [Part 5 - Create Messages With Turbo Streams and Action Cable](https://github.com/scottmascio2115/demo-turbo-chat/pull/7)
- [Part 6 - Add and Remove Logged in/out Users](https://github.com/scottmascio2115/demo-turbo-chat/pull/8)

For parts 5 and 6 you will need to have Redis installed and running.

## Why was this project created?
This is the starter project for the Turbo Rails internal conference talk at CMM.

We will convert this project from a CRUD application to a single page application using Turbo Rails.

## How to follow along
In the top right section of the GitHub repo you can fork the project and follow along during the talk.


## How this project was created
rails new demo-turbo-chat --css=bootstrap --javascript=esbuild --database=postgresql

#### Ruby Version
3.1.2

#### Rails Version
7.0.5

#### Turbo Rails Version
1.4.0

## How To Set Up Project
### With docker (recommended)
+ `docker-compose build`
+ `docker-compose up`
+ visit http://localhost:3000
### Local
+ Bundle Install
+ bin/setup to install dependencies
+ Set envars for `REDIS_URL` (see `config/cable.yml`), and `POSTGRES_HOST`, `POSTGRES_USER`, `POSTGRES_PASSWORD` (see `config/database.yml`)
+ bin/dev to start rails server, precompile CSS and JS
+ Visit http://localhost:3000

## Models
__Message__
 - body
 - user_id
 
 __User__
  - Devise attributes

User -has_many-< Messages 

## Not out of the box Rails Gems
- gem "simple_form", "~> 5.1.0"
- gem "devise", "~> 4.8.1"
