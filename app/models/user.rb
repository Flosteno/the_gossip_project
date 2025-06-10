class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :sent_messages, class_name: 'PrivateMessage', foreign_key: 'sender_id'
  has_many :recipients
  has_many :received_messages, through: :recipients, source: :private_message
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true
  validates :email, presence: true
  validates :age, presence: true
  validates :city, presence: true
end
