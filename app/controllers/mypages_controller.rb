class MypagesController < ApplicationController
  def index
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
