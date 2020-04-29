class Teller < ApplicationRecord
  attr_accessor :year, :month
  belongs_to :user
  belongs_to :company
  belongs_to :country
  delegate :name, to: :company, prefix: true
  delegate :name, to: :country, prefix: true

  before_validation :assign_country, :set_the_date
  before_save :set_opening_balance

  validates :date, uniqueness: { scope: :user_id, message: 'single entry per month allowed (per user)'}
  validates :cash_in, presence: true
  validates :cash_out, presence: true

  default_scope { order(:date) }

  def balance
    opening.to_f + cash_in.to_f - cash_out.to_f
  end

  private

    def assign_country
      self.country_id = company&.country_id
    end

    def set_the_date
      self.date = DateTime.new(year.to_i, month.to_i) if year.present? && month.present?
    end

    def set_opening_balance
      self.opening = last_entry&.balance
    end

    def last_entry
      Teller.where('date < ?', date).last
    end
    
end
