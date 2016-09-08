# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
	attr_accessor :current_password
  attr_accessible :email, :name, :password, :password_confirmation, :current_password
  has_secure_password
  has_many :posts

  validates :name, presence: true
  validates :email, presence: true

end
