class ProductsController < ApplicationController
  before_action :set_product, only: [:destroy, :exhibit]

  require 'payjp'

  def details
  end
  
  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save(product_params)
      redirect_to exhibit_product_path(@product.id)
    else
      render "index"
    end
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def show
    @products = Product.all
  end

  def update
  end

  def destroy
    if @product.destroy
      redirect_to mypages_path, notice: '削除しました'
    else
      redirect_to mypages_path, alert: '削除できませんでした'
    end
  end

  def exhibit
  end

  def comfirm

  end

  def buying
    Payjp.api_key = "sk_test_b7523af6ac88df1a31e90bbe"
    Payjp::Charge.create(
      amount: 809,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name, :image, :description, :product_category_id, :brand, :condition, :delivery_fee, :shipping_area, :days_before_shipping, :price, :status).merge(seller_id: current_user.id)
  end
  
  def sell
  end

  def exhibit
    @product = Product.find(params[:id])
  end

end

