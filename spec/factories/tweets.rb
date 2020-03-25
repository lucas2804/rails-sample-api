FactoryBot.define do
  factory :tweet do
    content { "MyText" }
    user_id { 1 }
    status { 1 }
  end
end
