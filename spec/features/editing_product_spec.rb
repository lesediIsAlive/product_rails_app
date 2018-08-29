require "rails_helper"

RSpec.features "A user edits a product" do
   before do 
        @product = Product.create(name:"Canon 5D Mark IV DSLR with 24-70mm f/4L Lens",
            description:"Canon EOS 5D Mark IV DSLR Camera with 24-70mm f/4L Lens",price: 55489.00)
    end
    scenario "A user successfully updates a product" do
        visit "/"

        click_link @product.name
        click_link "Edit Product"

        fill_in "Name", with: "Canon 4D DSLR"
        fill_in "Description", with: "50mm f1,8 STM"
        fill_in "Price", with: "25000.00"

       expect(page).to have_content("Product has been updated")
       expect(page.current_path).to eq(product_path(@product))
    end

    scenario "A user tired to update a product with with an invalid parameter" do
        visit "/"
        click_link @product.name
        click_link "Edit Product"

        fill_in "Name", with: ""
        fill_in "Description", with: ""
        fill_in "Price", with: ""

        expect(page).to have_content("Product has not been updated")
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("You need to set a price")
    end
end