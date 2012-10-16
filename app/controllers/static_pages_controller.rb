class StaticPagesController < ApplicationController
  def home
    @product = Product.all
  end

  def about
  end

  def contact
  end

  def help
  end
end
