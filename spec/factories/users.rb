FactoryBot.define do
  factory :user do
    name              {"yamada"}
    email                {"nanashi@gmail.com"}
    password              {"yamada123"}
    password_confirmation {password}
  end
end
