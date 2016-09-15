require 'faker'
require 'harry_potter_faker'

HPFaker = HarryPotterFaker.new()


# creating admin account 
User.create( 
    username: stewart,
    email: stewart@stewart.com,
    global_admin: true,
    password: 'password'
     )

15.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    global_admin: false,
    password: 'password'
    )
end

30.times do 
  Experiment.create(
    approved?: true,
    title: Faker::Lorem.sentence,
    hypothesis: Faker::Lorem.sentence,
    summary: Faker::Lorem.sentence,
    body: Faker::Lorem.sentence
    )
end

30.times do 
  Experiment.create(
    approved?: true,
    title: Faker::Lorem.sentence,
    text: Faker::Lorem.sentence
  )
end

