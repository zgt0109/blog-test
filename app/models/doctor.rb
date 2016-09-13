class Doctor
	include DataMapper::Resource
	include DataMapper::MassAssignmentSecurity

	property :id, Serial
	property :name, String

  attr_accessible :name

  has n, :diseases
  has n, :users, :through => :diseases
end
