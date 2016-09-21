FactoryGirl.define do
  factory :user do
    name "User Name"
    email "user@gmail.com"
    image "http://profile_image.png"
  end
  
  factory :searching_group do
    group_leader 1
    name "Denver Couples: Winter 2016"
    description "We are a group of friends that love to ski. "
    location "Vail"
    max_number_of_people 12
    max_budget_per_month 300.00
  end
  
  factory :users_group do
    user
    searching_group
  end
  
  factory :user_listing do
    user
    name "Vail and Beaver Creek weekender $200"
    url "https://rockies.craigslist.org/apa/5774733580.html"
  end
  
  factory :group_listing do
    user_listing
    searching_group
  end
  
  factory :user_ranking do
    user
    group_listing
  end
end
