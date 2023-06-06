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
+ Bundle Install
+ bin/setup to install dependencies
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
