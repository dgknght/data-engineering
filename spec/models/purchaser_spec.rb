require 'spec_helper'

describe Purchaser do
  let (:attributes) do
    {
      first_name: 'John',
      last_name: 'Doe'
    }
  end

  it 'should be creatable from valid attributes' do
    purchaser = Purchaser.new(attributes)
    expect(purchaser).to be_valid
  end

  # For a production application, additional we would additional check for required
  # fields, valid values, etc.
end
