require 'rails_helper'

RSpec.describe Observation, :type => :model do
  let (:experiment) { Experiment.create()}
  let (:user) { User.create()}
  let (:comment) { Comment.create()}
  let (:observation) {Observation.create(id:1, user_id: user.id, experiment_id: experiment.id, title: "Mice like cheese", text: "our experiment shows that mice like cheese", check_in: 'Sun, 01 Jan 2012 00:00:00 +0300', check_out: 'Mon, 02 Jan 2012 00:00:00 +0300')}

  describe "observation attributes" do

    it "has a title" do
      expect(observation.title).to eq ('Mice like cheese')
    end

    it "has text" do
      expect(observation.text).to eq ('our experiment shows that mice like cheese')
    end

    it "has a check-in time" do
      expect(observation.check_in).to eq ('Sun, 01 Jan 2012 00:00:00 +0300')
    end

    it "is invalid without a check-in time" do
      expect(observation.check_out).to eq ('Mon, 02 Jan 2012 00:00:00 +0300')
    end
  end

  describe "observation associations" do
    it "should have a user associated" do
      Observation.reflect_on_association(:user).macro.should eq(:belongs_to)
    end

    it "should have an experiment associated" do
      Observation.reflect_on_association(:experiment).macro.should eq(:belongs_to)
    end

    it "should have many comments associated" do
      Observation.reflect_on_association(:comments).macro.should eq(:has_many)
    end
  end
end

