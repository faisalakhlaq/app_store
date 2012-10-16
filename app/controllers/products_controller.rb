class ProductsController < ApplicationController
  #before_filter :admin_user,     only: [:destroy, :create]

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @product = Product.paginate(page: params[:page])
  end

  def create
    # only if the current user is admin then the product creation should be possible
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "New item / product created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(params[:product])
      flash[:success] = "Item updated"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Item / product deleted."
    redirect_to root_path
  end

  #def admin_user
   # redirect_to(root_path) unless current_user.admin?
  #end
end