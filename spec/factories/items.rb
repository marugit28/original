FactoryBot.define do
  factory :item do
    itemname           { Faker::Name.initials }
    explanation         { Faker::Lorem.sentence }
    category_id         { '2' }
    degree_id            { '2' }
    region_id           { '2' }
    scheduled_delivery_id { '2' }
    atmosphere_id         {'2'}
    price                { '700' }
    association :user
  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end
end