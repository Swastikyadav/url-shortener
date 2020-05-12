# URL shortener API

This is a url shortener API, build with Ruby On Rails 6.

## Cloning and Usage

- Clone this repo to your local system.
- Execute `rails db:create` to create the database for the first time.
- Execute `rails db:migrate` to migrate the database and create tables in your database.

## Testing the app

We have rake tasks to mimic the API calls, So to test the app do the following.

- Start your server with `rails server`.

To shorten a URL run following rake task.

- `rake app:encode URL=https://yourdesiredurl.com/`

Result will be something like this:

- The shortened url of **https://yourdesiredurl.com/** is **https://short.is/tkLo2367**

To get original_url from the shortened url run the following rake task.

- `rake app:decode SHORTURL=https://short.is/tkLo2367`

Result will be:

- The original url of short url **https://short.is/tkLo2367** is **https://yourdesiredurl.com/**

## EndPoints

Shorten new URL:
  - EndPoint - `/links`, POST
  - Params - { "link": { "url": "https://desiredurl.com/" } }

Get Original URL from shortened one:
  - EndPoint - `/links/https://short.is/tkLo2367`, GET
  - Params - No params

THANK YOU
