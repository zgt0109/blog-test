class Topic
	include Mongoid::Document
	include Mongoid::Timestamps

	field :user_id
	field :name, type: String
	field :content, type: String

  belongs_to :user
  attr_accessible :content, :name

  validates :name, presence: true

  paginates_per 3
end
