class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String


	attr_accessor :current_password
  attr_accessible :email, :name, :password, :password_confirmation, :current_password
  has_secure_password
  has_many :topics

  has_many :diseases
  ###

  paginates_per 2

  validates :name, presence: true
  validates :email, presence: true

end
