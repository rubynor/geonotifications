# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :aoi do
    locations [[59.1370, 9.75],
               [59.1370, 9.5],
               [59.1340, 9.5],
               [59.1340, 9.75]]
    categories ['estate_for_sale']
    title 'nabolaget'
  end
end
