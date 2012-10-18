class Order < ActiveRecord::Base
  #some tests should be in a central location and used in this and users class e.g email_regex
  attr_accessible :name, :address, :email, :pay_type
  before_save { |order| order.email = email.downcase }

  PAYMENT_TYPES = [ "Check" , "Credit card" , "PayPall" ]

  has_many :line_items, :dependent => :destroy

  validates :name, :address, :pay_type, :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX }
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

end
