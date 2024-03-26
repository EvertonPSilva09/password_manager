# table_name "users"
# string "email", default: "", null: false
# string "encrypted_password", default: "", null: false
# string "reset_password_token"
# datetime "reset_password_sent_at"
# datetime "remember_created_at"
# datetime "created_at", null: false
# datetime "updated_at", null: false
# index ["email"], name: "index_users_on_email", unique: true
# index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_passwords
  has_many :passwords, through: :user_passwords
end
