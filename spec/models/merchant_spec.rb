require 'spec_helper'

describe Merchant do
  let (:attributes) do
    {
      name: 'ACME Co.',
      address: '1234 Main St'
    }
  end

  it 'should be creatable from valid attributes' do
    merchant = Merchant.new(attributes)
    expect(merchant).to be_valid
  end

  # In a production app, we would have additional tests for required fields, valid values, etc.

  describe '#find_or_create!' do
    let!(:merchant) { FactoryGirl.create(:merchant, name: 'The First Store') }

    it 'should return an existing merchant if a match is found' do
      expect do
        Merchant.find_or_create!(name: 'The First Store', address: '1234 Elm St')
      end.not_to change(Merchant, :count)
    end

    it 'should create a new merchant if a match is not found' do
      expect do
        Merchant.find_or_create!(name: 'Another Store', address: '1234 Elm St')
      end.to change(Merchant, :count).by(1)
    end
  end
end
