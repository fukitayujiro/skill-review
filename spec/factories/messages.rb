FactoryBot.define do
  factory :message do
    point              {"2"}
    text                {"1111112222233333"}
    association :user
    association :content
  end
end
