require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do

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

  scenario "They see all products" do
    # ACT
    visit root_path

    # visit "/cart/add_item?product_id=#{@category.products.last.id}"
    # page.find('btn btn-primary')
    click_on @category.products.last.id

    # DEBUG / VERIFY
    save_screenshot
    expect(page).to have_content('My Cart (1)')
  end

end
