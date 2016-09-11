class Doctor
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :name, type: String

  attr_accessible :name

  has_many :diseases

  def users
  	User.in(id: diseases.map(&:user_id))
  end
  ###
end
