# == Schema Information
#
# Table name: diseases
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  doctor_id  :integer
#  name       :string(255)
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_diseases_on_doctor_id  (doctor_id)
#  index_diseases_on_user_id    (user_id)
#

class Disease < ActiveRecord::Base
  belongs_to :user
  belongs_to :doctor
  attr_accessible :content, :name, :user_id, :doctor_id
end
