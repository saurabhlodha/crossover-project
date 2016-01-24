require 'faker'
FactoryGirl.define do
  factory :trip do
    destination  Faker::Address.city
    start_date  '2012-01-02'
    end_date  '2012-12-01'
    comment  'Some text'
    user
  end

  factory :invalid_trip, class: Trip do
    destination  Faker::Address.city
  end

  factory :manali, class: Trip do
    destination  'Manali'
    start_date  '2012-01-02'
    end_date  '2012-12-01'
    comment  'Manali is a city in India'
    user
  end

  factory :bali, class: Trip do
    destination  'Bali'
    start_date  '2013-01-01'
    end_date  '2013-12-01'
    comment  'Bali is a country near Indonesia'
    user
  end

  factory :china, class: Trip do
    destination  'China'
    start_date  '2014-01-01'
    end_date  '2014-12-01'
    comment  'China is a country in Asia'
    user
  end

  factory :chile, class: Trip do
    destination  'Chile'
    start_date  '2015-01-01'
    end_date  '2015-12-01'
    comment  "I don't know where Chile is."
    user
  end

end
