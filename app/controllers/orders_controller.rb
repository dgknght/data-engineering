class OrdersController < ApplicationController
  def index
    @orders = []

    @processor = OrderFileProcessor.new
  end
end
