class Experiment < ApplicationRecord
  has_and_belongs_to_many :users
  belongs_to :project_admin, class_name: "User"
  has_many :observations
  has_many :comments, through: :observations
end
