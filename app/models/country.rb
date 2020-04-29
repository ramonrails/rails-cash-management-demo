class Country < ApplicationRecord
  # country.tellers becomes possible
  # requirement 4.
  # INFO: opening column will not work for this.
  # we can either have a separate table (if the business logic needs it)
  # or we can just country.tellers.sum(:cash_in) and cash_out, then fetch last_entry.opening and get our value
  has_many :tellers
end
