class User < ApplicationRecord
  # we just need this for the registration process
  attr_accessor :role
  # user has roles
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #  user.companies
  has_many :companies
  # user.countries
  has_many :countries, through: :companies
  # user.tellers
  has_many :tellers
  # registered role gets assigned
  # a user can have multiple roles
  before_save :assign_role

  # name + roles
  def display_name
    [email, roles.collect(&:name).reject(&:blank?)].flatten.join(', ')
  end

  private

    # here we actually assign a role to the user
    def assign_role
      # keep it downcase for easier maintainable code
      role.presence && self.grant(role.downcase)
    end
end
