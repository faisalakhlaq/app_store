class User < ActiveRecord::Base
  attr_accessible :address, :card_number, :card_type, :email, :name, :password, :role
end
