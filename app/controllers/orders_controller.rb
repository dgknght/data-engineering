class OrdersController < ApplicationController
  def index
    @orders = Order.all
    @total = @orders.reduce(0) { |total, order| total += order.purchase_amount } 
  end

  def upload
    processor = OrderFileProcessor.new(params[:upload])
    processor.process
    redirect_to orders_path
  end
end
