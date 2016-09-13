class Disease
	include DataMapper::Resource
	include DataMapper::MassAssignmentSecurity

	property :id, Serial
	property :user_id, Integer
	property :doctor_id, Integer
	property :name, String
	property :content, Text
	
  belongs_to :user
  belongs_to :doctor

  attr_accessible :content, :name, :user_id, :doctor_id
end
