class User < ApplicationRecord
  attr_accessor :role
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :companies
  has_many :countries, through: :companies
  has_many :tellers
  before_save :assign_role

  def display_name
    [email, roles.collect(&:name).reject(&:blank?)].flatten.join(', ')
  end

  private

    def assign_role
      role.presence && self.grant(role.downcase)
    end
end
