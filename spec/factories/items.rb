FactoryBot.define do
  factory :item do
    itemname {Faker::Team.name}
  end

  after(:build) do |item|
    item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
  end
end