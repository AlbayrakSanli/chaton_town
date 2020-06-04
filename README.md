# Week 9

## The Hacking Project - Chaton Town

#### [Click here to access the website on Heroku](lien)

email administrateur : chaton-sauvage@yopmail.com

## Ruby & Rails versions

* Ruby 2.5.1
* Rails 5.2.4

## Installing and Launching

To start app, you may have to do : <br />

* $ heroku run rails db:migrate:status
* $ heroku run rails db:create
* $ heroku run rails db:migrate
* $ heroku run rails db:seed

Otherwise, if you ever run this app on <em> localhost:3000 </em>, please do :

* $ bundle install
* $ rails db:create
* $ rails db:migrate
* $ rails db:migrate:status
* $ rails db:seed
* $ rails server

If you encounter an error like 'user already connected on localhost', you may use :

* $ lsof -wni tcp:4567  <br /> 
and fetch the PIB number

Then do : <br />

* $ kill -9 [PIB]

## Database initialization

To fulfill the database with data run: 

* $ rails db:seed



