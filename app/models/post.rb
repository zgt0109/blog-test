class Post
	include DataMapper::Resource
	include DataMapper::MassAssignmentSecurity

	property :id, Serial
	property :name, String
	property :title, String
	property :content, Text
	property :created_at, DateTime, :default => DateTime.now
	property :updated_at, DateTime, :default => DateTime.now
	property :user_id, Integer

  attr_accessible :content, :name, :title, :user_id

  validates_presence_of :name, :title 
  validates_length_of :title, :minimum => 5

  has n, :comments
  belongs_to :user
end
