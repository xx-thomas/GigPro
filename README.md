**Members**

Lidia Toledo (lrt2131)
Mauricio Gonzalez (mg4148)
Stacey Yao (sy3042)
Thomas Varghese (tpv2108)

Heroku Link: https://whispering-forest-46585-5bccc3a7881b.herokuapp.com/

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

GigPro is best experienced from the perspective multiple users, so create at least three accounts to see all features. One should be a “customer” and the other two should be “workers”. Note customers and workers are not roles in GigPro, customers and workers are just regular users (e.g. any user can create and accept gigs) , it’s just to understand GigPro.


On the customer account, create a gig. Use one of the existing seed gigs as inspiration if form inputs are unclear. Log out and log into both worker accounts. They should both have received notifications. With one of workers, click the notification link and hit accept on the gig. Now this worker has been assigned to the gig. Sign back into the customer account and check notifications. There should be a “your gig has been accepted notification”. Click the notification again to go to the gig (or visit the general gigs page) and this time hit complete. Now the customer has agreed that the worker has completed the job and the workers balance will be increased by the payment and his rating will go up.


The above instructions constitute the basic workflow. Others features include being able change languages by clicking one of the languages in the nav bar and a universal search bar.



**Coverage (Cucumber + RSpec Combined)**

![Screenshot 2023-12-18 at 11 42 04 AM](https://github.com/xx-thomas/GigPro/assets/113865951/e69774a9-8863-4aeb-92bc-48c810f228b4)

