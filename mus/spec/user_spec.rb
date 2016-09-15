require 'rails_helper'

RSpec.describe User, type: :model do

  let (:user) { User.create(id: 1, username: 'tchua93', email: 'tchua93@gmail.com', password: '1234') }

  describe "user attributes" do

    it "user has a name" do
      expect(user.username).to eq ('tchua93')
    end

    it "user has a email" do
      expect(user.email). to eq ('tchua93@gmail.com')
    end

    it "user has a password" do
      expect(user.password).to eq ('1234')
    end
  end

  describe "user associations" do

    let (:experiment) { Experiment.create()}
    let (:observation) { Observation.create()}
    let (:comment) { Comment.create()}

    it "user has many experiments" do
      5.times do
        user.experiments << experiment
      end

      user.experiments.each do |experiment|
        expect(experiment.class).to eq(Experiment)
      end
    end

    it "user has many observations" do
     5.times do
        user.observations << observation
     end

      user.observations.each do |observation|
        expect(observation.class).to eq(Observation)
      end
    end

    it "user have many comments" do
      5.times do
        user.comments << comment
      end
      user.comments.each do |comment|
        expect(comment.class).to eq(Comment)
      end
    end
  end


end
