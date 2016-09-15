class Observation < ApplicationRecord
  belongs_to :user
  belongs_to :experiment
  has_many :comments
end
