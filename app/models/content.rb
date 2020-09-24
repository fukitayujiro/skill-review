class Content < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :medium
  has_one_attached :image
  belongs_to :content
  has_many :messages
end
