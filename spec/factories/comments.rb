FactoryGirl.define do
  factory :comment do
    id 1
    content "MyText"
    user_id 1
    post_id 1
  end
end
