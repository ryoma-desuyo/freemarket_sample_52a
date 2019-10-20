class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy, :exhibit, :comfirm, :details, :buying, :result]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :exhibit]
  require 'payjp'

  def details
  end
  
  def index
    @products = Product.all.order(created_at: "DESC").order(created_at: "DESC")
    @products_ladies = Product.where(product_category: 'レディース').order(created_at: "DESC").order(created_at: "DESC")
    @products_mens = Product.where(product_category: 'メンズ').order(created_at: "DESC")
    @products_appliances = Product.where(product_category: '家電・スマホ・カメラ').order(created_at: "DESC")
    @products_toys = Product.where(product_category: 'おもちゃ・ホビー・グッズ').order(created_at: "DESC")
    @products_chanel = Product.where(brand: 'シャネル').order(created_at: "DESC")
    @products_louis_vuitton = Product.where(brand: 'ルイヴィトン').order(created_at: "DESC")
    @products_supreme = Product.where(brand: 'シュプリーム').order(created_at: "DESC")
    @products_nike = Product.where(brand: 'ナイキ').order(created_at: "DESC")
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to exhibit_product_path(@product.id)
    else
      redirect_to new_product_path, alert: '出品に失敗しました。'
    end
  end

  def new
    @product = Product.new
    @product.product_images.build
  end

  def edit
    @image_count = @product.product_images.length
    @product.product_images.build
  end

  def show
    @products = Product.all
    @product_images = ProductImage.all
  end

  def update
    if @product.update(update_product_params)
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
    @product_images = @product.product_images
  end

  def comfirm
    if current_user.selling_products.present? && current_user.selling_products.find_by(id: params[:id]).present?
      redirect_to root_path, alert: '自分が出品した商品の購入はできません'
    elsif @product.buyer_id.present?
      redirect_to root_path, alert: "この商品は購入できません"
    end
  end

  def buying
    if current_user.selling_products.present? && current_user.selling_products.find_by(id: params[:id]).present?
      redirect_to root_path, alert: '自分が出品した商品の購入はできません' 
    elsif @product.buyer_id.present?
      redirect_to root_path, alert: "この商品は購入できません"
    end
  end

  def result
    if current_user.selling_products.present? && current_user.selling_products.find_by(id: params[:id]).present?
      redirect_to comfirm_product_path(id: params[:id]), alert: '自分が出品した商品の購入はできません'
    else
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: params['payjp-token'],
      currency: 'jpy'
    )
    @product.buyer_id = current_user.id
    @product.save
    end
  end

private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:id, :name, :description, :product_category, :brand, :condition, :delivery_fee,
    :shipping_area, :days_before_shipping, :price, :status, product_images_attributes: [:image]).merge(seller_id: current_user.id)
  end

  def update_product_params
    params.require(:product).permit(:id, :name, :description, :product_category, :brand, :condition, :delivery_fee,
    :shipping_area, :days_before_shipping, :price, :status, product_images_attributes: [:image, :_destroy, :id]).merge(seller_id: current_user.id)
  end

  def ensure_correct_user
    @product = Product.find(params[:id])
    if @product.seller_id != current_user.id
      flash[:notice] = "エラー：自分の投稿のみ編集・削除可能です。"
      redirect_to root_path
    end
  end


end

