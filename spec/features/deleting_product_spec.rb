require "rails_helper"

RSpec.features "A user delete a product" do
   before do 
        @product = Product.create(name:"Canon 5D Mark IV DSLR with 24-70mm f/4L Lens",
            description:"Canon EOS 5D Mark IV DSLR Camera with 24-70mm f/4L Lens",price: 55489.00)
    end
    scenario "A user deletes a product" do
        visit "/"
        click_link @product.name
        click_link "Delete Product"

        expect(page).to have_content("Article has been deleted")
        expect(current_path).to eq(products_path)
        
    end


end