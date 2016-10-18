require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true  do

  # SETUP
  before :each do
    @category = Category.create! id: 1, name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "They see the correct product after clicking on it from homepage" do
    # ACT
    visit root_path
    #click on product path

    # puts @category.products.last.name
    visit "/products/#{@category.products.last.id}"

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content @category.products.last.name
  end

end
