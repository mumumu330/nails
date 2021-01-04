FactoryBot.define do
  factory :post_image do
    caption { "test" }
    user
    after(:build) do |post_image|
      post_image.images.attach(io: File.open('spec/fixtures/test_image.jpg'), filename: 'test_image.jpg', content_type: 'image/jpg')
    end
  end
end
