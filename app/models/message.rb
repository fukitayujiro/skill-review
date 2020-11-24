class Message < ApplicationRecord
  belongs_to :user
  belongs_to :content

  with_options presence: true, numericality: { other_than: 1 } do
    validates :point
  end

  with_options presence: true do
    validates :text
  end
  
end
