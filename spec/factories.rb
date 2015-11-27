FactoryGirl.define do 
  factory :user do
     first_name "Kate"
     last_name "Young"
     sequence(:email) { |n| "user#{n}@odot.com" }
     password "MyString"
     password_confirmation "MyString"
  end
 
  factory :ingredient do
    name "Salt"
  end

  factory :recipe do
    name "Spaghetti"
    description "Spaghetti and Meatballs"
  end
end
