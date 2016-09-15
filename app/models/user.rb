class User < ApplicationRecord
  has_and_belongs_to_many :experiments
  has_one :experiment, foreign_key: :project_admin_id, class_name: "User"
  has_many :comments
  has_many :observations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
