require "rails_helper"

RSpec.feature "listing all articles" do
s    before do 
        @product1 = Product.create(name:"Canon 5D Mark IV DSLR with 24-70mm f/4L Lens",
            description:"Canon EOS 5D Mark IV DSLR Camera with 24-70mm f/4L Lens",price: 55489.00)
        @product2 = Product.create(name: "Nikon D850 45.7MP DSLR Body Only", description:"Nikon D500 20.9MP with 50mm f1.4G Lens and SB-5000 Speedlight Flash",price: 52489.00)
    end

    scenario "A user list all products" do
        visit "/"

        expect(page).to have_content("All Products")
        expect(page).to have_content(@product1.name)
        expect(page).to have_content(@product1.price)

        expect(page).to have_content(@product2.name)
        expect(page).to have_content(@product2.price)
    end

    scenario "A user has no products" do
        Product.delete_all

        expect(page).to have_content("All Products")
        expect(page).to have_content("There are no products.")
        expect(page).not_to have_content(@product1.name)
        expect(page).not_to have_content(@product1.price)

        expect(page).not_to have_content(@product2.name)
        expect(page).not_to have_content(@product2.price)


        
    end
end