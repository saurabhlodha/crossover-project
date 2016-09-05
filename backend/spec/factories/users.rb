require 'faker'
FactoryGirl.define do
  factory :user do
    email                 { Faker::Internet.email }
    password              'testing123'
    password_confirmation 'testing123'
    access_level					:user
  end

  factory :invalid_user, class: User do
    email                 { Faker::Internet.email }
    password              'testing123'
    password_confirmation 'Testing123'
    access_level          :user
  end

  factory :manager, class: User do
    email                 { Faker::Internet.email }
    password              'testing123'
    password_confirmation 'testing123'
    access_level					:agent
  end

  factory :admin, class: User do
    email                 { Faker::Internet.email }
    password              'testing123'
    password_confirmation 'testing123'
    access_level					:admin
  end

end
