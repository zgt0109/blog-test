class Disease
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :user_id
	field :doctor_id
	field :name, type: String
	field :content, type: String

  belongs_to :user
  belongs_to :doctor
  attr_accessible :content, :name, :user_id, :doctor_id
end
