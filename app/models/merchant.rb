# An entity that sells products or services
class Merchant < ActiveRecord::Base
  has_many :orders

  # Returns an existing merchant that matches the specified
  # attributes, or creates a new one if none are found
  def self.find_or_create!(attributes)
    result = self.find_by_name(attributes[:name])
    result || self.create!(attributes)
  end
end
