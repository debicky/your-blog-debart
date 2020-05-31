# Another poor blog app.

## Basic blog app.

Bootstraped-blog application with nested comments.


### There are mainly 2 types of users:

1. Unregistered guest/registered user -  users can order products They can add maximum 5 items at once. Choose size of them.
  At shopping cart there is subtotal and total price of the order. 
  They still can update amount and size of the product. 
  **Order item operations are done without page refreshing thanks to AJAX.**
  Cart view is rendered after placing first item to it.
  **After placing an order email with quantity and total cost of products is send to user.**
  
2. Administrator - can CRUD products.
  - *New product*, - name, description, image, price and category of product.
  - *New sizes*, ability to add new sizes for products. 
  - *New categories*, ability to add new cetegories for products. 
  - *Orders*, **administrator of the shop can check orders. Their value, pay type and customer details.**

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
   
8. gem "figaro"
   > almost the same as dotenv-rails. Keeping my sensitive information and allows securely configure Rails applications 
   
9. gem "aws-sdk-s3"
   > needed to upload files to Amazon S3 bucket in production.
   


