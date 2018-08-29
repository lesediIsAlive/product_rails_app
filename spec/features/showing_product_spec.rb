require "rails_helper"

RSpec.feature "showing individual products" do 
    before do
        @product = Product.create(name:"Canon 5D Mark IV DSLR with 24-70mm f/4L Lens",
                    description:"Canon EOS 5D Mark IV DSLR Camera with 24-70mm f/4L Lens",price: 55489.00)
    end
    
    scenario "shows an individual product" do        
        visit "/"
        click_link @product.name
        
        expect(page).to have_content("#{@product.name}")
        expect(page).to have_content("#{@product.description}")
        expect(page).to have_content("#{@product.price}")
        expect(current_path).to eq(product_path(@product))
    end
end