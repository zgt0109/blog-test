class Comment
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :post_id
	field :commenter, type: String
	field :body, type: String

  belongs_to :post
  attr_accessible :body, :commenter, :post
end
