# == Schema Information
#
# Table name: doctors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Doctor < ActiveRecord::Base
  attr_accessible :name

  has_many :cases
  has_many :users, :through => :cases
end
