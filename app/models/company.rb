class Company < ApplicationRecord
  # only in case of assignment, run our method
  attr_writer :country_name
  belongs_to :country
  belongs_to :user
  # quickly fetch all transactions for this company
  # company.tellers
  has_many :tellers
  # additional associations to roles and multipe users
  has_many :users_roles
  has_many :users, through: :users_roles
  has_many :roles, through: :users_roles

  # country_name works
  delegate :name, to: :country, prefix: true

  # company must be unique but only for the user
  # another user can also have the same company
  validates :name, uniqueness: { scope: :user_id, message: 'duplicates not allowed'}

  # WARN: this is only the assignment. persist in DB as needed
  def country_name=(name)
    self.country = Country.find_or_create_by(name: name)
  end
end
