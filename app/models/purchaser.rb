# Someone that purchaser products or services from merchants
class Purchaser < ActiveRecord::Base
  has_many :orders

  # Returns a purchaser having the specified name, or creates
  # a new purchaser if no match is found
  def self.find_or_create!(full_name)
    first_name,last_name = *full_name.split(' ')
    attributes = {first_name: first_name, last_name: last_name}
    result = where(attributes).first
    result || create!(attributes)
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
