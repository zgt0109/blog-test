class Tag
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :post_id
	field :name, type: String

  belongs_to :post
  attr_accessible :name
end
