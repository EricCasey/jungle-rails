require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validation' do

    before(:each) do
      @category = Category.new
      @category['id'] = 100
      @product = Product.new
      @product['category_id'] = @category.id
      @product['name'] = 'test product 123 OMG'
      @product['quantity'] = 100
      @product['price_cents'] = 101.to_i
    end

    it 'should validate precence of :price' do
        expect(@product).to validate_presence_of :price_cents
        expect(@product.errors.size).to equal(3)
    end
    it 'should validate precence of :name' do
        expect(@product).to validate_presence_of :name
        expect(@product.errors.size).to equal(1)
    end
    it 'should validate precence of :category_id' do
        expect(@product).to validate_presence_of :category_id
        expect(@product.errors.size).to equal(1)
    end
    it 'should validate precence of :quantity' do
        expect(@product).to validate_presence_of :quantity
        expect(@product.errors.size).to equal(1)
    end
  end

    it 'new product should have no name' do
      @product = Product.new()
      expect(@product.name).to be_nil
      # puts @product.errors.size
      # puts @product.errors.full_messages
    end
end
