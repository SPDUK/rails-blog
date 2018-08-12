# README

This README would normally document whatever steps are necessary to get the
application up and running.

How to run locally:
clone the repo
make sure you are using ruby 2.5.1, if not run  ``` rvm install ruby-2.5.1```

Install gems```bundle install``` or ```bundle install --without production```
Migrate and set up the datbase ```rake db:migrate```
Then start the server ```rails s``` or if using cloud9 or similar you may need to specify a port instead``` rails s -b $IP -p $PORT```

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
