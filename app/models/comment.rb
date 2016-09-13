class Comment
	include DataMapper::Resource
	include DataMapper::MassAssignmentSecurity

	property :id, Serial
	property :commenter, String
	property :body, Text
	property :post_id, Integer
	property :created_at, DateTime, :default => DateTime.now
	property :updated_at, DateTime, :default => DateTime.now

  belongs_to :post
  attr_accessible :body, :commenter, :post_id
end
