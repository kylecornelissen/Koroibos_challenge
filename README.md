# Koroibos
In this project, I used Rails and ActiveRecord to build a JSON API which exposes the Olympian csv data schema.

## System Requirements:
* Ruby version: 5.2.3
* Ruby 2.4.1

## Gems Used
* RSpec-rails
* Capybara
* Factory_bot_rails
* Selenium-webdriver
* Shoulda-matchers
* Simplecov
* Pry
* Fast_jsonapi
* Faker

## Importing the CSV files
- run 'rake import:seed' in your terminal command line

## Opening up the app in browser
- run 'rails s' in your terminal command line
- go to your browser and connect to your local host (localhost:3000 by default)

## Schema
<img width="613" alt="schema" src="https://user-images.githubusercontent.com/46171611/65176445-4d3d3900-da44-11e9-90a0-aca80574f7a1.png">

## Olympian Endpoints
- GET api/v1/olympians
- GET api/v1/olympians?age=youngest
- GET api/v1/olympians?age=oldest

## Olympian Stats Endpoint
- GET api/v1/olympian_stats

## Events Endpoint
- GET api/v1/events

## Event Medalists Endpoint
- GET api/v1/events/:id/medalists
