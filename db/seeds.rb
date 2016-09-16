require 'faker'
# require 'harry_potter_faker'

# HPFaker = HarryPotterFaker.new()

User.delete_all
# creating admin all
Experiment.delete_all
Observation.delete_all
# account
User.create(
    username: 'stewart',
    email: 'stewart@stewart.com',
    global_admin?: true,
    password: 'password'
     )

15.times do
  User.create(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    global_admin?: false,
    password: 'password'
    )
end

users = User.all
user = User.order("RANDOM()").first

30.times do
  Experiment.create(
    approved?: true,
    title: Faker::Lorem.sentence,
    hypothesis: Faker::Lorem.sentence,
    summary: Faker::Lorem.sentence,
    body: Faker::Lorem.sentence,
    project_admin_id: user.id
    )
end

30.times do
  Experiment.create(
    approved?: false,
    title: Faker::Lorem.sentence,
    hypothesis: Faker::Lorem.sentence,
    summary: Faker::Lorem.sentence,
    body: Faker::Lorem.sentence,
    project_admin_id: user.id
    )
end

experiments = Experiment.all
experiment = Experiment.order("RANDOM()").first

30.times do
  Observation.create(
    title: Faker::Lorem.sentence,
    text: Faker::Lorem.sentence,
    experiment_id: experiment.id,
    user_id: user.id
  )
end

experiments.each do |experiment|
  user = User.order("RANDOM()").first
  experiment = Experiment.order("RANDOM()").first
  Team.create(user_id: user.id, experiment_id: experiment.id)
end
