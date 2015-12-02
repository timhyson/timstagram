FactoryGirl.define do
  factory :user do
    email 'foo@bar.com'
    user_name 'foobar'
    password 'foobar1234'
    id 1
  end

  factory :user_two, class: User do
    email 'bar@foo.com'
    user_name 'barfoo'
    password 'barfoo1234'
  end
end
