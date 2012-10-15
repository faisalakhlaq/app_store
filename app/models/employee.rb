# == Schema Information
#
# Table name: employees
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  email       :string(255)
#  password    :string(255)
#  designation :string(255)
#  description :text
#  interests   :string(255)
#  image_url   :string(255)
#  role        :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Employee < ActiveRecord::Base
  attr_accessible :description, :designation, :email, :image_url, :interests, :name, :password, :role
end
