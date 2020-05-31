# Another boring blog app :).

## Basic blog app.

Bootstraped-blog application with nested comments. **Comments are added without refreshing thanks to AJAX.**


### There are 3 types of users:

1. Unregistered guest - Can visit articles, see comments and nested comments. To leave comment or create an article has to login.

2. Registered user - users can create articles and comments.
  Only articles and comments witch belongs to user can be deleted by them. 
   
3. Administrator - can CRUD articles and comments.
  - *New article*, - name, body with rich_text, image.
  - *Deleting comments*, - administrator is allowed to delete everything.


### Specs

* Ruby & Ruby on Rails version
  > 2.6.5 & 6.0.2 

* System dependencies
  > Ubuntu 18.04.4 LTS


### Used gems

1. gem 'bootstrap' 
   > easy solution for basic RWD layout. Card system used widely around application. Usefull navbar with dropdown buttons.

2. gem 'gem "devise-bootstrap-views"'
   > Bootstraped devise forms.
   
3. gem 'devise'
   > my favourite gem. Extra fast and easy authentication system. Various additional features like: trackable - user login count, IP, last time visited and many more, confirmable - sending email with confirmation instructions and lot more.
   
4. gem 'will_paginate'
   > Pagination feature for articles.
   
5. gem 'faker'
   > funny and useful gem to seed database. Used to create users, articles  and comments.
   
6. gem 'friendly_id'
   > enhance your ordinary URLs. Insted of having courses/12345 we can have courses/titleofmycourse.
   
7. gem 'dotenv-rails'
   > to keep personal/secret data safe during development.

8. gem "aws-sdk-s3"
   > needed to upload files to Amazon S3 bucket in production.
   


