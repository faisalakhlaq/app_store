module ProductsHelper
  def find_product_by_id(id) # the find function is not returning the product when used in other controllers. Therefore implementing this public method
    product = Product.find(params[id])
    return product
  end
end
