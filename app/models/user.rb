class User
  include DataMapper::Resource
  include DataMapper::MassAssignmentSecurity
  include ActiveModel::SecurePassword

  property :id, Serial
  property :name, String
  property :email, String
  property :password_digest, String, :length => 255
  property :created_at, DateTime, :default => DateTime.now
  property :updated_at, DateTime, :default => DateTime.now

  has_secure_password
	attr_accessor :current_password, :password_confirmation
  attr_accessible :email, :name, :password, :password_confirmation, :current_password
  
  has n, :posts
  has n, :topics

  paginates_per 2

  has n, :diseases
  has n, :doctors, :through => :diseases

  validates_presence_of :name, :email
end
