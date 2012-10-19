class ProductsController < ApplicationController
  #before_filter :admin_user,     only: [:destroy, :create]

  def new
    if admin_user?
      @product = Product.new
    else
      flash[:failure]= "Sorry you do not have the rights to edit a product"
      redirect_to root_url
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.paginate(page: params[:page])
    #@product = Product.paginate :page=>params[:page], :per_page => 10
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "New item / product created!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    if admin_user?
      @product = Product.find(params[:id])
    else
      flash[:failure]= "Sorry you do not have the rights to edit a product"
    end
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

  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
      format.xml { render :xml => @product }
    end
  end

  #def admin_user
   # redirect_to(root_path) unless current_user.admin?
  #end
end