FactoryBot.define do
  factory :item do
    association :user

    title { Faker::Name.name }
    introduction { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 6) }
    buy_prefecture_id { Faker::Number.between(from: 1, to: 48) }
    price_id { Faker::Number.between(from: 1, to: 6) }
    season_id { Faker::Number.between(from: 1, to: 6) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end