class Doctor
	include DataMapper::Resource
	include DataMapper::MassAssignmentSecurity
	include ActiveModel::SecurePassword

	property :id, Serial
	property :name, String
	property :password_digest, String, :length => 255
	property :created_at, DateTime, :default => DateTime.now
	property :updated_at, DateTime, :default => DateTime.now

	has_secure_password
	paginates_per 2
	attr_accessor :password_confirmation
  attr_accessible :name,:password, :password_confirmation

  has n, :diseases
  has n, :users, :through => :diseases
end
