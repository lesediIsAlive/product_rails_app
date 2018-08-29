require "rails_helper"

RSpec.describe "Products", type: :request do 
   before do 
        @product = Product.create(name:"Canon 5D Mark IV DSLR with 24-70mm f/4L Lens",
            description:"Canon EOS 5D Mark IV DSLR Camera with 24-70mm f/4L Lens",price: 55489.00)
    end

    describe 'GET /products/:id' do 
        context 'with existing product' do
            before {get "/products/#{@product.id}"}
        
            it "handles existing product" do
                expect(response.status).to eq 200
            end
        end

        context 'with non-existing product' do
            before {get "/products/xxxx"}
            
            it "handles non-existing product" do
                expect(response.status).to eq 302
                flash_message = "This product you are looking for could not be found"
                expect(flash[:alert]).to eq flash_message
            end
        end

        
    end
end