class Experiment < ApplicationRecord
  has_many :teams
  has_many :users, :through => :teams
  belongs_to :project_admin, class_name: "User"
  has_many :observations
  has_many :comments, through: :observations
end
