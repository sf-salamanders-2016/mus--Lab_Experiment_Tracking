class User < ApplicationRecord
  has_many :teams
  has_many :experiments, :through => :teams

  has_one :experiment, foreign_key: :project_admin_id, class_name: "User"
  has_many :comments
  has_many :observations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


end
