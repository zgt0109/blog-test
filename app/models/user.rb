class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword

  field :name, type: String
  field :email, type: String
  field :password_digest, type: String
  field :auth_token, type: String 

	attr_accessor :current_password
  attr_accessible :email, :name, :password, :password_confirmation, :current_password
  has_secure_password
  has_many :topics
  has_many :posts

  has_many :diseases
  ###
  def doctors
    Doctor.in(id: diseases.map(&:doctor_id))
  end

  paginates_per 2

  validates :name, presence: true
  validates :email, presence: true

end
