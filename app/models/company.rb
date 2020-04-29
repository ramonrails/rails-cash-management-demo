class Company < ApplicationRecord
  belongs_to :country
  belongs_to :user
  has_many :tellers

  delegate :name, to: :country, prefix: true

  validates :name, uniqueness: { scope: :user_id, message: 'duplicates not allowed'}
end
