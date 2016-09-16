require 'rails_helper'

RSpec.describe Experiment, :type => :model do
  let (:user) { User.create()}
  let (:observation) { Observation.create()}
  let (:experiment) { Experiment.create(project_admin_id: user.id, title: "Mouse Hunt", hypothesis: "Finds cheese and eats cheese", summary: "Placing mouse in experimental maze with a prize of cheese", body: "The mouse is allergic to cheese and did not move") }

  describe "experiments" do
    describe "validations" do

      it "has a project admin" do
        expect(experiment.project_admin_id).to eq (user.id)
      end

      it "has a title" do
        expect(experiment.title).to eq ('Mouse Hunt')
      end

      it "has a hypothesis" do
        expect(experiment.hypothesis).to eq ('Finds cheese and eats cheese')
      end

      it "has a summary" do
        expect(experiment.summary).to eq ('Placing mouse in experimental maze with a prize of cheese')
      end

      it "has a body" do
        expect(experiment.body).to eq ('The mouse is allergic to cheese and did not move')
      end
    end

    describe "experiment associations" do
      it "should have an project_admin associated" do
        Experiment.reflect_on_association(:user).macro.should eq(:belongs_to)
      end

      it "should have an observation associated" do
        Experiment.reflect_on_association(:observation).macro.should eq(:has_many)
      end
    end
  end
end
