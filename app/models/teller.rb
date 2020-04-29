class Teller < ApplicationRecord
  attr_accessor :year, :month
  # user.tellers
  belongs_to :user
  # company.tellers
  belongs_to :company
  # country.tellers
  belongs_to :country
  # company_name
  delegate :name, to: :company, prefix: true
  # country_name
  delegate :name, to: :country, prefix: true

  # date uniqueness needs this
  before_validation :assign_country, :set_the_date
  # we can set this just before record gets saved
  before_save :set_opening_balance
  # now update the next entry
  after_save :update_next_entry

  # one entry per month per user
  # another user can have the same month entry
  # same user can never have duplicate rows for any month
  validates :date, uniqueness: { scope: :user_id, message: 'single entry per month allowed (per user)'}
  validates :cash_in, presence: true
  validates :cash_out, presence: true

  # always keep teller entries sorted by date
  default_scope { order(:date) }

  # balance value of this entry
  def balance
    opening.to_f + cash_in.to_f - cash_out.to_f
  end

  private

    def assign_country
      self.country_id = company&.country_id
    end

    # datetime field allows us to quickly sort and search
    # no additional heavy logic required to calculate previous/next entry
    def set_the_date
      self.date = DateTime.new(year.to_i, month.to_i) if year.present? && month.present?
    end

    def set_opening_balance
      self.opening = last_entry&.balance
    end

    # no validations. callbacks fired (chain reaction forward)
    def update_next_entry
      return if next_entry.nil?

      # this balance is the opening for the next entry
      next_entry.update_attributes(opening: balance)
    end

    # entry just before this one. maybe not previous month. any month before this
    def last_entry
      Teller.where('date < ?', date).last
    end

    # entry after this one. maybe not next month, any month after this
    def next_entry
      Teller.where('date > ?', date).first
    end
    
end
