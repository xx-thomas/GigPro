**Members**

Lidia Toledo (lrt2131)
Mauricio Gonzalez (mg4148)
Stacey Yao (sy3042)
Thomas Varghese (tpv2108)

Heroku Link: TBD

**Instructions**

*Requires*
Ruby Version: ruby 3.2.2
Rails version: 7.1.1

0. bundle install
1. bin/rails db:migrate
2. bin/rails db:seed
3. bin/rails server
4. bundle exec cucumber
5. bundle exec rspec



**How to use GigPro**

Sign up and create a gig. You will be initially given a balance of 1000 to create gigs with.
After a gig is created, you can log out and create a different user and accept the gig.
The first user/creator is meant to be the "customer" and the second user/acceptor is meant to be
the "worker". Once the the gig is accepted, log back into the first user and hit complete gig.
The payment for the gig will be transfered to the worker and their rating will go up. You can check this in the drop down My Account and then click Profile. Also you can change language at any time during the above process by clicking english or espanol in the nav bar.
