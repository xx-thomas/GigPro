**Members**

Lidia Toledo (lrt2131)
Mauricio Gonzalez (mg4148)
Stacey Yao (sy3042)
Thomas Varghese (tpv2108)

Heroku Link: https://mighty-sierra-55632-34e80f480c4c.herokuapp.com/

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

Sign up and create a gig. You will be initially given a balance of 1000 to create gigs with.
After a gig is created, you can log out and create a different user and accept the gig.
The first user/creator is meant to be the "customer" and the second user/acceptor is meant to be
the "worker". Once the the gig is accepted, log back into the first user and hit complete gig.
The payment for the gig will be transfered to the worker and their rating will go up. You can check this in the drop down My Account and then click Profile. Also you can change language at any time during the above process by clicking english or espanol in the nav bar.

**Notes**

Things we upgraded from iteration 1:

1. User sign up (No more creating customers/workers)
2. Language support
3. A basic user interface with better calidation

Things we plan to add for the demo:

1. Notifications by location/following other users
2. Searching/filtering
3. Final user interface
4. Mock data to populate website


**Coverage Screenshots (RSpec and Cucumber Combined)**
<img width="1280" alt="Screenshot 2023-11-24 at 6 30 15 PM" src="https://github.com/xx-thomas/GigPro/assets/113865951/cd4b0de2-adda-4e1a-a586-74a81b4ba08d">
