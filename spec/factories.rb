FactoryGirl.define do 
  factory :ingredient do
    name "Salt"
  end

  factory :recipe do
    name "Spaghetti"
    description "Spaghetti and Meatballs"
  end
end
