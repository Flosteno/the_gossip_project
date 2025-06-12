class Gossip < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :gossip_tags, dependent: :destroy
  has_many :tags, through: :gossip_tags
  has_many :likes, dependent: :destroy
  has_many :likers, through: :likes, source: :user
  accepts_nested_attributes_for :tags
  validates :title, presence: true, length: { in: 3..14 }
  validates :content, presence: true
end
