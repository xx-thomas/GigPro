**Members**

Lidia Toledo (lrt2131)
Mauricio Gonzalez (mg4148)
Stacey Yao (sy3042)
Thomas Varghese (tpv2108)

Heroku Link: https://enigmatic-mountain-39586-866bb6cfddd9.herokuapp.com/

**Instructions**

*Requires*
Ruby Version: ruby 3.2.2
Rails version: 7.1.1

0. bundle install
1. bin/rails db:migrate
2. bin/rails server

(For Testing)
3. bundle exec cucumber
4. bundle exec rspec



**How to use GigPro**

1. Create a customer at the /customers route using the form
2. Create a worker at the /workers route using the form
3. Create a gig at the /gigs route
4. Complete a gig at the /gigs route by clicking on a gig and clicking complete

**Notes**
1. Users can now choose between English or Spanish by toggling between the two from the Navbar.
2. Login or Create an Account if it's your first time using GigPro by selecting Log In from the Navbar.
3. When creating a gig, the customer id will be 1 if its the first customer visible on /customers route, 2 if its the second.
The same applies for worker id.
4. Cucumber coverage only shows 80% but in reality is 100%. If you look at the index.html file generated during cucumber, youll see the files
not covered are files auto generated by rails. All code written by us has full coverage.
5. Lastly, creating a worker/customer is not meant to be part of GigPro, this should be created automatically on login. When we implement
login/auth, we will make these routes not visible and directly lead you to /gigs and the view will be dependent on whether you are a customer or a worker.
For example, workers will not be allowed to complete a gig. Only customers can, since that results in payment being made to the worker.
