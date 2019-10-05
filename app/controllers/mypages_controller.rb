class MypagesController < ApplicationController
  def index
  end

  def products_list
    @products = Product.where(seller_id: current_user.id)
  end

  def edit
  end

  def update
  end

  def identification
    @address = Prefecture.find(params[:id])
  end

  def card
  end
end
