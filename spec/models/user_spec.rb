require 'rails_helper'

RSpec.describe User, type: :model do

context "Validations" do

    before(:each) do
      @user = User.create(
      name: 'eric',
      email: '   eric@gmail.com',
      password: 'suj',
      password_confirmation: 'suj'
      )
    end

  it "should be a valid user" do
    expect(@user.password).to eq(@user.password_confirmation)
  end

  it "shoud be a unique email" do
    expect(@user.email)
  end

  it 'be like 3 chars but it' do
    should validate_length_of(:password_digest).is_at_least(3).on(:create)
  end

  it 'should check for uniqueness' do
    @user2 = User.create(
    name: 'eric',
    email: 'ERIC2@gmail.com',
    password: 'suj',
    password_confirmation: 'suj'
    )
    should validate_uniqueness_of(:email)
    expect(@user.email.downcase.strip).not_to eq(@user2.email.downcase.strip)
  end
end

  # describe 'Validation' do
  #
  #   before(:each) do
  #     @user = User.new
  #     @user['name'] = 'user123'
  #     @user['password_digest'] = 'test123'
  #     @testPass = 'test123'
  #     @user['email'] = 'eric@gmail.com'
  #
  #     @user2 = User.new
  #     @user2['name'] = 'user123'
  #     @user2['password_digest'] = 'test123'
  #     @testPass2 = 'thisisthewrongpassword'
  #     @user2['email'] = 'email@test.com'
  #   end
  #
  #   it 'passwords should match' do
  #     expect(@user.password_digest).to eq(@testPass)
  #     # puts @user.errors.size
  #     # puts @user.errors.full_messages
  #   end
  #
  #   it 'if passwords dont match there is error but it' do
  #     expect(@user2.password_digest).not_to eq(@testPass2)
  #   end
  #
  #   it 'has an email address but it' do
  #     expect(@user.email).not_to eq(nil)
  #   end
  #
  #   it 'has a name but it' do
  #     expect(@user.name).not_to eq(nil)
  #   end
  #
  #   it 'be a unique email and it' do
  #     puts User.find(@user['id'])
  #     expect(User.find(@user.email))
  #   end
  # end
  #
  # describe '.authenticate_with_credentials' do
  #   # examples for this class method here
  # end


end
