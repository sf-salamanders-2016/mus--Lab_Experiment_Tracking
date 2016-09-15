FactoryGirl.define do
  factory :experiment do
    title { Faker::Name.first_name }
    body { Faker::Name.last_name }
  end
end
