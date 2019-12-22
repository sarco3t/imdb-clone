FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    sequence :password do |n|
      "person#{n}@example.com"
    end

    trait :admin do
      role { :admin }
    end
  end
end
