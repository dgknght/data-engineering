class Order < ActiveRecord::Base
  belongs_to :merchant
  belongs_to :purchaser

  # The total amount to be collected for the order
  def purchase_amount
    item_price * purchase_count
  end
end
