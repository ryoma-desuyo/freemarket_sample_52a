class ProductsController < ApplicationController

  def details
  end
  
  def index
    @products = Product.all
    @products_ladies = Product.where(product_category_id: 'レディース')
    @products_mens = Product.where(product_category_id: 'メンズ')
    @products_appliances = Product.where(product_category_id: '家電・スマホ・カメラ')
    @products_toys = Product.where(product_category_id: 'おもちゃ・ホビー・グッズ')
    @products_chanel = Product.where(brand: 'シャネル')
    @products_louis_vuitton = Product.where(brand: 'ルイヴィトン')
    @products_supreme = Product.where(brand: 'シュプリーム')
    @products_nike = Product.where(brand: 'ナイキ')
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
  end

  def show
    @products = Product.all
  end

  def update
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
