FactoryBot.define do
  factory :content do
    title              {"111112222233333444445555566666"}
    media_id                 {"2"}
    genre_id              {"2"}
    introduction        {"11111111111111122222222222222222223333333333333333344444444444444444444"}
    association :user
  end
end