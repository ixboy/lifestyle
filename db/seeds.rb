require 'faker'

User.destroy_all
100.times do
  User.create!(name: Faker::Name.unique.name[1..15],
    email: Faker::Internet.unique.email, 
    password: '123456',
    password_confirmation: '123456')
end

p '100 users created'

Category.destroy_all
Category.create!([{
                   name: 'Business'
                 },
                  {
                    name: 'Entertainment'

                  },
                  {
                    name: 'Magazine'

                  },
                  {
                    name: 'Fashion'

                  },
                  {
                    name: 'Sports'
                  }])

p '5 categories created'

Article.destroy_all

4.times do
  Article.create!([{
                    title: Faker::Lorem.sentence(word_count: 3),
                    text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                    image: 'https://source.unsplash.com/daily?business',
                    user_id: rand(1..4),
                    category_id: 1
                  },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                    image: 'https://source.unsplash.com/daily?entertainment',
                     user_id: rand(1..4),
                     category_id: 2
                   },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                     image: 'https://source.unsplash.com/daily?magazine',
                     user_id: rand(1..4),
                     category_id: 3
                   },
                   {
                     title: Faker::Lorem.sentence(word_count: 3),
                     text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                     image: 'https://source.unsplash.com/daily?fashion',
                     user_id: rand(1..4),
                     category_id: 4
                   },
                   {
                    title: Faker::Lorem.sentence(word_count: 3),
                    text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false),
                    image: 'https://source.unsplash.com/daily?sports',
                    user_id: rand(1..4),
                    category_id: 5
                  }])
end

p '16 articles created'

100.times do |index|
  Vote.create!({
                 user_id: index + 1,
                 article_id: rand(1..16)
               })
end

p '100 random votes created'