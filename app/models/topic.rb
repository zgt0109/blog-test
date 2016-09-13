class Topic
	include DataMapper::Resource
	include DataMapper::MassAssignmentSecurity

	property :id, Serial
	property :user_id, Integer
	property :name, String
	property :content, Text
	property :created_at, DateTime, :default => DateTime.now
	property :updated_at, DateTime, :default => DateTime.now

  belongs_to :user
  attr_accessible :content, :name, :user_id

  validates_presence_of :name

  paginates_per 3
end
