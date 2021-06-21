require 'faker'

FactoryBot.define do
  factory :user, class: 'User' do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { '123456' }
    password_confirmation { '123456' }
  end

  factory :category, class: 'Category' do
    name { Faker::Lorem.characters(number: 10) }
    priority { 1 }
  end

  factory :article, class: 'Article' do
    title { Faker::Lorem.sentence(word_count: 2) }
    text { Faker::Lorem.paragraph_by_chars(number: 15, supplemental: false) }
    image { 'https://source.unsplash.com/daily?sports' }
    user_id { rand(1..4) }
    category_id { rand(1..4) }
  end

  factory :vote, class: 'Vote' do
    user_id { rand(1..4) }
    article_id { rand(1..16) }
  end
end
