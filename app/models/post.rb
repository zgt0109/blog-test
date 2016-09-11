class Post
	include Mongoid::Document
	include Mongoid::Timestamps

	field :user_id
	field :name, type: String
	field :title, type: String
	field :content, type: String

  attr_accessible :content, :name, :title, :tags_attributes, :user_id

  validates :name, :presence => true
  validates :title, :presence => true, :length => { :minimum => 5 }
  has_many :comments, :dependent => :destroy
  has_many :tags
  belongs_to :user

  accepts_nested_attributes_for :tags, :allow_destroy => :true, :reject_if => proc { |attrs| attrs.all? { |k,v| v.blank? } }
end
