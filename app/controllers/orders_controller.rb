class OrdersController < ApplicationController
  def index
    # A more robust and intuitive method for showing only the recently uploaded
    # orders would be better here, but it was necessary to keep this simple to
    # avoid spending too much time for the challenge
    @orders = specified_orders || Order.all
    @total = @orders.reduce(0) { |total, order| total += order.purchase_amount } 
  end

  def upload
    processor = OrderFileProcessor.new(params[:upload])
    orders = processor.process
    flash[:order_ids] = orders.map { |o| o.id }
    redirect_to orders_path
  end

  private
    def specified_orders
      return flash[:order_ids] ? Order.find(flash[:order_ids]) : nil
    end
end
