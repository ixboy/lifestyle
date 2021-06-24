require 'rails_helper'

RSpec.describe Article, type: :model do
  it 'has valid attributes' do
    expect(article).to be_valid
  end

  it 'is not valid without category' do
    article = Article.create(category_id: nil)
    expect(article).to_not be_valid
  end

  it 'is not valid without a user' do
    article = Article.create(user_id: nil)
    expect(article).to_not be_valid
  end

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
  end

  describe 'Associations' do
    it { should belong_to(:category).without_validating_presence }
  end

  describe 'Associations' do
    it { should have_many(:votes).without_validating_presence }
  end

  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:article) { create(:article, user_id: user.id, category_id: category.id) }
end
