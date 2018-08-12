# Blogs on Rails
### https://spduk-rails-blog.herokuapp.com/
It might take a few seconds to load because it's hosted on heroku for free.

___

A CRUD app including search, join tables and authentication including admin rights, made with Ruby on Rails using SQLite/PostgreSQL database.

* **Articles** - A list of all articles posted by any user
* **Users**- A list of all current signed up users, each have a profile showing all articles
* **Categories** - A list of Categories that an admin can add to or edit the name of, clicking on a category shows anything in that category

All routes include authentication and authorization, admins can edit/delete articles, users and categories.
___

### To run locally
* Clone the repo
* Make sure you are using ruby 2.5.1, if not run  ``` rvm install ruby-2.5.1``` [using rvm](https://rvm.io/)
* Install gems```bundle install``` or ```bundle install --without production```
* Migrate and set up the datbase ```rake db:migrate```
* Start the server ```rails s``` or if using cloud9 or similar you may need to specify a port instead``` rails s -b $IP -p $PORT```
* To run tests ```rake test```

### To host on heroku
* Sign up, create a project
* Commit all your changes then run ``` git push heroku master ``` then ```heroku run rake db:migrate```

