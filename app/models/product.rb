class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :languages, :price, :title, :version
end
