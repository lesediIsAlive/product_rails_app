class ProductsController < ApplicationController
    before_action :set_product, only: [:show,:edit,:destroy,:update]
    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        if @product.save
            flash[:success] = "You have created the product."
            redirect_to products_path
        else
            flash[:danger] = "Product has not been created."
            render :new
        end
    end


    def index
        @products = Product.all
    end

    def show
        
    end

    def destroy
    end



    private

    def product_params
        params.require(:product).permit(:name,:description,:price)
    end

    def set_product
        @product = Product.find(params[:id])
    end
end