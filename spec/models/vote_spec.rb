require 'rails_helper'

RSpec.describe Vote, type: :model do
  it 'has valid attributes' do
    expect(vote).to be_valid
  end

  describe 'Associations' do
    it { should belong_to(:article).without_validating_presence }
  end

  describe 'Associations' do
    it { should belong_to(:user).without_validating_presence }
  end

  it 'is valid with a user' do
    expect(vote).to be_valid
  end

  it 'is not valid without a user' do
    vote = Vote.new(user_id: nil, article_id: article.id)
    expect(vote).to_not be_valid
  end

  it 'is not valid without an article' do
    vote = Vote.new(user_id: user.id, article_id: nil)
    expect(vote).to_not be_valid
  end

  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:article) { create(:article, user_id: user.id, category_id: category.id) }
  let(:vote) { create(:vote, article_id: article.id, user_id: user.id) }
end
