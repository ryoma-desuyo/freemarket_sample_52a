class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :exhibit]

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
    set_product
  end

  def update
    set_product
    if @product.update(product_params)
      redirect_to exhibit_product_path
    else
      redirect_to product_edit_path, alert: '編集に失敗しました'
    end
  end

  def destroy
    if @product.destroy
      redirect_to mypages_path, notice: '削除しました'
    else
      redirect_to mypages_path, alert: '削除できませんでした'
    end
  end

  def exhibit
    set_product
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :image, :description, :product_category_id, :brand, :condition, :delivery_fee, :shipping_area, :days_before_shipping, :price, :status).merge(seller_id: current_user.id)
  end

  def buying
  end
  
  def sell
  end
end

