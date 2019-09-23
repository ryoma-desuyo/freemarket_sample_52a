require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#destroy' do
  it "product_id delete" do
    product = build(:product, id: nil)
    expect(product.errors[:id]).to include("can't be blank")
    end
  end
end
