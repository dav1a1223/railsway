FactoryGirl.define do
  factory :article do
    title { Faker::Lorem.sentence }
    url { Faker::Internet.url }
    from 'Rubyflow'
    decription { Faker::Lorem.sentence }
    author 'David Lai'
  end
end
