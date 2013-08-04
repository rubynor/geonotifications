# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email 'user2@test.no'
    password 'test'
    password_confirmation 'test'
  end
end
