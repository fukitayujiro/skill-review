class Content < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :medium
  has_one_attached :image
  belongs_to :user, optional: true
  has_many :messages

  paginates_per 20

  with_options presence: true do
    validates :title
    validates :introduction
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :media_id
    validates :genre_id
  end

end
