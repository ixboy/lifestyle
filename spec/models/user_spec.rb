require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should be valid' do
    expect(User.new(name: 'Ismael', email: 'hello@email.com', password: '123456',
                    password_confirmation: '123456')).to be_valid
  end

  it 'it should not be valid if the name is too short' do
    expect(User.new(name: 'Ix', email: 'hello@email.com', password: '123456',
                    password_confirmation: '123456')).to_not be_valid
  end

  it 'is not valid with a long name' do
    expect(User.new(name: 'aksdbasbdasjdbajshdbc asdbajsb aj')).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:articles).without_validating_presence }
  end

  describe 'Associations' do
    it { should have_many(:votes).without_validating_presence }
  end
end
