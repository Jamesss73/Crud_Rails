class ProductsController < ApplicationController
  def index
    @products = Product.all

    respond_to do |format|
      format.html 
      format.json { render json: @products }
    end
  end

  def new
    @product = Product.new
  end

  def back
    redirect_to products_path
  end

  def create
    @product = Product.new(product_params)
      if @product.save
        redirect_to products_path
      else
        render :new
      end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to products_path
      else
        render :edit
      end
  end

  def show  ###  es el metodo Delete pero por alguna razon  no logro que se use correctamente
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path, notice: "Producto eliminado correctamente", deleted: true
  end

  def delete
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path, notice: "Producto eliminado correctamente"
  end

  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end
end
