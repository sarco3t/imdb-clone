FactoryBot.define do
  factory :rating do
    score { 1 }
    movie { nil }
    user { nil }
  end
end
