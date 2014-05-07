class ProductsController < ApplicationController
 
  def index
    @products = Product.find_with_reputation(:votes, :all, order: 'votes desc')
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = current_user.products.new(params[:product])
    if @product.save
      redirect_to @product
    else
      render action: "new" 
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      redirect_to @product
      else
        render action: "edit" 
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url 
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @product = Product.find(params[:id])
    @product.add_or_update_evaluation(:votes, value, current_user)
    redirect_to :back, notice: "Thank you for voting!"
  end


end
