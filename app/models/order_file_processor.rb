require 'csv'

# Reads order information for delimited text files and adds them to the data store
class OrderFileProcessor
  attr_accessor :file

  def initialize(attributes = {})
    self.file = attributes[:file]
  end

  def process
    raise 'a file must be specified' unless self.file
    csv = CSV.new(self.file.read, col_sep: "\t")
    # Drop the first line, which is guaranteed by the requirements to be the header
    csv.drop(1).map { |row| process_row(*row) }
  end

  private
    # The requirements guarantee that the columns will always be in the same order
    def process_row(purchaser_name, item_description, item_price, purchase_count, merchant_address, merchant_name)
      purchaser = Purchaser.find_or_create!(purchaser_name)
      merchant = Merchant.find_or_create!(name: merchant_name, address: merchant_address)
      Order.create!(purchaser: purchaser,
                    merchant: merchant,
                    item_description: item_description,
                    item_price: item_price,
                    purchase_count: purchase_count)
    end
end
