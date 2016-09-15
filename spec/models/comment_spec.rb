require 'rails_helper'

RSpec.describe Comment, type: :model do

  let (:comment) { Comment.create(text: "This is a comment!") }

  describe "comment attributes" do

    it "has text" do
      expect(comment.text).to eq ('This is a comment!')
    end

  end

  describe "comment associations" do

    let (:observation) { Observation.create()}
    let (:user) { User.create(id: 1, username: 'tchua93', email: 'tchua93@gmail.com', password: '1234') }


    it "comment belongs to an observation" do
      5.times do
        observation.comments << comment
      end

      observation.comments.each do |comment|
        expect(comment.class).to eq(Comment)
      end
    end

    it "comment belongs to a user" do
     5.times do
        user.comments << comment
     end

      user.observations.each do |observation|
        expect(comment.class).to eq(Comment)
      end
    end


  end


end
