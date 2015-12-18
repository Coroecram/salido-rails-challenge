#Salido Rails Challenge

This Rails challenge was to create an app which integrated with the [Wine API][wine-api]

##Functionality

This app can link up to and pull down objects from the wine.com database api, based on query parameters inputted into a form. It then passes the hits, if any, into its own database. Once there, the app has the functionality to edit the entries.

The application also allows a user to create new entries manually.

Of note, a service is included to handle the parsing of the feed from the API to keep the controller skinny.

##Test Suite

The app also has 40 included model and feature tests to back it up. Of course, there are always more tests that can be created, especially for the controller and better tests that can be written, but to display my level of skill for a few hours work.


When using this app, you will need to sign up for an account to obtain your own apikey. I have used the Figaro gem for handling my API key so it will not be available to you.

##Cool Stuff
There are a couple of cool things I'd like to point out with this app. First of all, I simply added [Kaminari][https://github.com/amatsuda/kaminari] to paginate the index page, there are appropriate flash[:errors] for invalid inputs, and [FactoryGirl][factory_girl] with [Faker][faker] were used to make models for testing.

###USING THIS APP
Once you get an API key from the [Wine API][wine-api], install figaro and run 'rails g figaro:install'. Then, in your newly made application.yml file, make a new key named WINE_API_KEY: "your_secret_api_key". More info here: [Figaro][figaro]

Then, you can run this app from a server.


[factory_girl]: https://github.com/thoughtbot/factory_girl
[faker]: https://github.com/stympy/faker
[figaro]: https://github.com/laserlemon/figaro
[kaminari]: https://github.com/amatsuda/kaminari
[wine-api]: https://api.wine.com
