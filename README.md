# URL shortener API
Live application with list of all shortened links: **https://shortly-link.herokuapp.com/**

This is a url shortener API, build with Ruby On Rails 6.

## Cloning and Usage

- Clone this repo to your local system.
- Execute `rails db:create` to create the database for the first time.
- Execute `rails db:migrate` to migrate the database and create tables in your database.
- Execute `yarn` to install frontend dependencies.

## Testing the app

We have rake tasks to mimic the API calls, So to test the app do the following.

- Start your server with `rails server`.

To shorten a URL run following rake task.

- `rake app:encode URL=https://yourdesiredurl.com/`

Result will be something like this:

- The shortened url of `https://yourdesiredurl.com/` is `https://short.is/tkLo2367`

To get original_url from the shortened url run the following rake task.

- `rake app:decode SHORTURL=https://short.is/tkLo2367`

Result will be:

- The original url of short url `https://short.is/tkLo2367` is `https://yourdesiredurl.com/`

## EndPoints

Shorten new URL:
  - EndPoint - `/links`, POST
  - Params - { "link": { "url": "https://desiredurl.com/" } }

Get Original URL from shortened one:
  - EndPoint - `/links/tkLo2367`, GET
  - Params - No params

## View Task (Pin url feature)

List of all urls with their shortened urls. Pin a url and it will move at the top of list.

#### Implementation Detail

- All links have an attribute named `pinned` which is `false` by default.
- When a user pins a link, the `pinned` attribute changes to `true`.
- And the list is ordered in descending order according to their `updated_at` time.
- Hence the last pinned link will have higher `updated_at` value and will appear at top of list.

THANK YOU
