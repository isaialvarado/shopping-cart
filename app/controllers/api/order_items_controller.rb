class Api::OrderItemsController < ApplicationController
  def create
    product_id = shopping_cart_params[:product_id]
    product = Product.find_by_id(product_id)

    if product.nil? || product.available_inventory.zero?
      render json: "Product not available", status: 422
    elsif shopping_cart.include?(product_id)
      render json: "Product already in shopping cart", status: 422
    else
      @item = OrderItem.new(shopping_cart_params)
      @item.shopping_cart_id = shopping_cart.id

      if @item.valid?
        @item.save
        shopping_cart.update_totals!
        render :show
      else
        render json: @item.errors.full_messages
      end
    end
  end

  def update
    @item = shopping_cart.items.find_by_id(params[:id])

    if @item
      quantity = shopping_cart_params[:quantity]
      @item.assign_attributes(quantity: quantity)

      if @item.valid?
        @item.save
        shopping_cart.update_totals!
        render :show
      else
        render json: item.errors.full_messages, status: 422
      end
    else
      render json: "Invalid ID", status: 422
    end
  end

  def destroy
    @item = shopping_cart.items.find_by_id(params[:id])

    if @item
      @item.destroy
      shopping_cart.update_totals!
      render :show
    else
      render json: "Invalid ID", status: 422
    end
  end

  def shopping_cart_params
    params.require(:shopping_cart_item).permit(:product_id, :quantity)
  end
end
