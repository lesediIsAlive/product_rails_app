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

    def edit
    end

    def update
        if @product.update(product_params)
           flash[:success] = "Product has been updated"
           redirect_to @product
       else
            flash.now[:danger] = "Product has not been updated"
            render :edit
       end
    end

    def destroy
        @product.destroy
        flash[:success] = "Product has been deleted"
        redirect_to products_path
    end

    protected

    def resource_not_found
        flash[:alert] = "This product you are looking for could not be found"
        redirect_to root_path
    end



    private

    def product_params
        params.require(:product).permit(:name,:description,:price)
    end

    def set_product
        @product = Product.find(params[:id])
    end
end