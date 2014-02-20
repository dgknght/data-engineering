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

  describe '#find_or_create!' do
    let!(:purchaser) { FactoryGirl.create(:purchaser, first_name: 'John', last_name: 'Doe') }

    it 'should create a new purchaser if none with the specified name exists' do
      expect { Purchaser.find_or_create!('Jane Doe') }.to change(Purchaser, :count).by(1)
    end

    it 'should return the existing purchaser if on already exists' do
      expect { Purchaser.find_or_create!('John Doe') }.not_to change(Purchaser, :count).by(1)
    end
  end

  describe '#full_name' do
    it 'should be combine the first and last name values' do
      purchaser = Purchaser.new(attributes)
      expect(purchaser.full_name).to eq('John Doe')
    end
  end
end
