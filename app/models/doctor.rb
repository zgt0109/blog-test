class Doctor
	include DataMapper::Resource
	include DataMapper::MassAssignmentSecurity

	property :id, Serial
	property :name, String
	property :created_at, DateTime, :default => DateTime.now
	property :updated_at, DateTime, :default => DateTime.now

  attr_accessible :name

  has n, :diseases
  has n, :users, :through => :diseases
end
