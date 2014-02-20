require 'spec_helper'

describe Order do
  let (:attributes) do
    {
      merchant: merchant,
      purchaser: purchaser,
      item_description: 'Gold brick',
      item_price: 100,
      purchase_count: 4
    }
  end
  let (:merchant) { FactoryGirl.create(:merchant) }
  let (:purchaser) { FactoryGirl.create(:purchaser) }

  it 'should be creatable from valid attributes' do
    order = Order.new(attributes)
    expect(order).to be_valid
  end

  describe '#purchase_amount' do
    it 'should equal the price times the quantity' do
      order = Order.new(attributes)
      expect(order.purchase_amount).to eq(400)
    end
  end
end
