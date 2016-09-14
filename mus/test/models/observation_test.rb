require 'test_helper'

class ObservationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  describe Observation, :type => :model do

    it "is valid with valid attributes" do
      expect(Observation.new).to be_valid
    end


    it "is valid with a title" do
    end

    it "is valid with text" do

    end

    it "is valid with a check-in time" do
    end

    it "is valid with a check-in time" do
    end


  end

end
