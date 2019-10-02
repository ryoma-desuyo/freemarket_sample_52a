class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy, :exhibit, :comfirm, :details, :buying, :result]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :exhibit]
  require 'payjp'

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
      if @product.save
          params[:product_images][:image].each do |image|
            @product.product_images.create(image: image, product_id: @product.id)
          end
        redirect_to exhibit_product_path(@product.id)
      else
        @product.product_images.build
        redirect_to new_product_path, alert: '出品に失敗しました'
      end
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def edit
  end

  def show
    @products = Product.all
    @product_images = ProductImage.all
  end

  def update
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
  end

  def comfirm

  end

  def buying

  end

  def result
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name, :description, :product_category_id, :brand, :condition, :delivery_fee,
    :shipping_area, :days_before_shipping, :price, :status, product_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def ensure_correct_user
    @product = Product.find(params[:id])
    if @product.seller_id != current_user.id
      flash[:notice] = "エラー：自分の投稿のみ編集・削除可能です。"
      redirect_to root_path
    end
  end


end

