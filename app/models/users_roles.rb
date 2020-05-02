# user <> roles table
# company added for each role
class UsersRole < ApplicationRecord
  belongs_to :user
  belongs_to :role
  # company can or cannot exist. do not force. keep flexible.
  belongs_to :company, optional: true
end
