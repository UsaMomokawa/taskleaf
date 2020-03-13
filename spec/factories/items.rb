FactoryBot.define do
  factory :item do
    name { Faker::Games::Pokemon.name }
    description { "Youtuberお勧め" * 4 }
    status { :unpurchased }
    priority { 0 }
  end
end
