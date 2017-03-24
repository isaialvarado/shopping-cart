class Api::OrdersController < ApplicationController
  def index
    @orders = Order.where.not(status: "pending")
  end

  def show
    @order = Order.where.not(status: "pending").find(params[:id])
  end
end
