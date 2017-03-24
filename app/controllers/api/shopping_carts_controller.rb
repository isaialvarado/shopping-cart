class Api::ShoppingCartsController < ApplicationController
  def show
  end

  def update
    if shopping_cart_params[:status] == "complete"
      message = Order.process_order(@cart)
      render json: message
    else
      @cart.assign_attributes(shopping_cart_params)

      if @cart.valid?
        @cart.update_totals!
        render :show
      else
        render json: @cart.errors.full_messages, status: 422
      end
    end
  end

  def destroy
    @cart.remove_items!
    @cart.update_totals!
    render :show
  end

  def shopping_cart_params
    params.require(:shopping_cart).permit(:tax, :shipping, :status)
  end
end
