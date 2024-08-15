require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = FactoryBot.build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid without an email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it 'is not valid if the name is too long' do
    user = FactoryBot.build(:user, name: 'a' * 256)
    expect(user).not_to be_valid
  end

  it 'is not valid if the email is too long' do
    user = FactoryBot.build(:user, email: 'a' * 256)
    expect(user).not_to be_valid
  end
end
