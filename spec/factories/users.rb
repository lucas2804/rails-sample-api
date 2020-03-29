FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@example.com"
    end
    password_digest { 'abc!@#4' }
  end
end
