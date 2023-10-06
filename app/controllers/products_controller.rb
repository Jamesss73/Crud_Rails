class ProductsController < ApplicationController
  # Método para mostrar una lista de todos los productos
  def index
    @products = Product.all

    respond_to do |format|
      format.html # Renderiza una vista HTML
      format.json { render json: @products } # Responde con datos JSON
    end
  end
  
  def show
    product = Product.find(params[:id])
    product.destroy
    # Redirige al usuario a la página de índice de productos con un mensaje de confirmación
    redirect_to products_path, notice: "Producto", deleted: true
  end

  # Método para mostrar un formulario para crear un nuevo producto
  def new
    @product = Product.new
  end

  # Método para redirigir al usuario a la página de índice de productos
  def back
    redirect_to products_path
  end

  # Método para crear un nuevo producto
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new # Vuelve a mostrar el formulario si hay errores
    end
  end

  # Método para mostrar un formulario para editar un producto existente
  def edit
    @product = Product.find(params[:id])
  end

  # Método para actualizar un producto existente
  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit # Vuelve a mostrar el formulario si hay errores
    end
  end

    # Método para eliminar un producto existente
    def deleted
      product = Product.find(params[:id])
      product.destroy
  
      # Redirige al usuario a la página de índice de productos con un mensaje de confirmación
      redirect_to products_path, notice: "Producto eliminado correctamente", deleted: true
    end

  private

  # Define los parámetros permitidos para crear o actualizar un producto
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end
end
