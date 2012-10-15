class ProductsController < ApplicationController
  before_filter :admin_user,     only: [:destroy, :create]
  def new
    @product = Product.new
  end

  def create
    @product = User.new(params[:product])
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
