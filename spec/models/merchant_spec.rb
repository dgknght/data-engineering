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
end
