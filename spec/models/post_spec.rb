# spec/models/post_spec.rb
require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    post = FactoryBot.build(:post)
    expect(post).to be_valid
  end

  it 'is not valid without a title' do
    post = FactoryBot.build(:post, title: nil)
    expect(post).not_to be_valid
  end

  it 'is not valid without a body' do
    post = FactoryBot.build(:post, body: nil)
    expect(post).not_to be_valid
  end

  it 'is not valid if the title is too long' do
    post = FactoryBot.build(:post, title: 'a' * 256)
    expect(post).not_to be_valid
  end

  it 'is not valid if the body is too long' do
    post = FactoryBot.build(:post, body: 'a' * 256)
    expect(post).not_to be_valid
  end
end
