# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  price       :decimal(8, 2)
#  version     :string(255)
#  description :text
#  image_url   :string(255)
#  languages   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :languages, :price, :title, :version

  has_many :line_items
  has_many :orders, :through => :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, :price, :presence => true

  validates :title, length: { maximum: 50 }
  validates :title, :uniqueness => true

  validates :image_url, :format => {
      :with => %r{\.(gif|jpg|png|jpeg)$}i,
      :message => 'must be a URL for JPEG, GIF, JPG or PNG image.'
  }

  validates :price, :numericality => {
      :greater_than_or_equal_to => 0.01,
      :message => 'Price must be numeric and greater then 0.01'
  }

  # ensure that there are no line items referencing this product
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
