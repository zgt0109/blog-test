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

  has_many :diseases
  has_many :users, :through => :diseases
end
