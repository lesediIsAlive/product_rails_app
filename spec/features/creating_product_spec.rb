require "rails_helper"

RSpec.feature "Creating products" do 
    scenario "A user created a new product" do
       visit "/"
       click_link "New Product"
       fill_in "Name", with: "Canon 200D DSLR"
       fill_in "Description", with: "Triple Lens Value Bundle
18-55mm DC Lens & 75-300mm DC Lens & 50mm f1,8 STM"
       fill_in "Price", with: "9989.00"

       click_button "Create Product"

       expect(page).to have_content("You have successfully created the product.")
       expect(page.current_path).to eq(products_path)

    end

    scenario "A user tries to create an invalid product" do
        visit "/"
        click_link "New Product"
        fill_in "Name", with: ""
        fill_in "Description", with: ""
       fill_in "Price", with: ""

       click_button "Create Product"

       expect(page).to have_content("Product has not been created")
       expect(page).to have_content("Name can't ne blank")
       expect(page).to have_content("You need to set a price")
    end
end