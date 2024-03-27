# table_name "passwords"
# string "url"
# string "username"
# string "password"
# datetime "created_at", null: false
# datetime "updated_at", null: false
#
class Password < ApplicationRecord
  has_many :user_passwords
  has_many :users, through: :user_passwords

  encrypts :username, deterministic: true
  encrypts :password
end
