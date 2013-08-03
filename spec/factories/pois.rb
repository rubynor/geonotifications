# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :poi do
    location [59.1356, 9.6]
    category 'estate_for_sale'
    title 'funkisbolig'
    description 'med fabuloso utsikt!'
  end
end
