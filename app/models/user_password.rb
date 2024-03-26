# table_name "user_passwords"
# bigint "user_id", null: false
# bigint "password_id", null: false
# datetime "created_at", null: false
# datetime "updated_at", null: false
# index ["password_id"], name: "index_user_passwords_on_password_id"
# index ["user_id"], name: "index_user_passwords_on_user_id"
#
class UserPassword < ApplicationRecord
  belongs_to :user
  belongs_to :password
end
