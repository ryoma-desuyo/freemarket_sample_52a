class ProductsController < ApplicationController

  def details
  end
  
  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to mypages_path
    else
      render "index"
      
    end
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    # @product.update(product_params)
    if @product.update(product_params)
      redirect_to exhibit_product_path, notice: "変更しました"
    else
      redirect_to product_edit_path, alert: "変更に失敗しました"
    end
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to("/")
  end

private
  def product_params
    params.require(:product).permit(:name, :image, :description, :product_category_id, :brand, :condition, :delivery_fee, :shipping_area, :days_before_shipping, :price, :status).merge(seller_id: current_user.id)
  end

  def buying
  end
  
  def sell
  end

  def exhibit
  end
end
