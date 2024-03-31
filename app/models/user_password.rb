# table_name "user_passwords"
# bigint "user_id", null: false
# string "role",
# bigint "password_id", null: false
# datetime "created_at", null: false
# datetime "updated_at", null: false
# index ["password_id"], name: "index_user_passwords_on_password_id"
# index ["user_id"], name: "index_user_passwords_on_user_id"
#
class UserPassword < ApplicationRecord
  # Viewer can only view the password
  # Editor can view and edit the password
  # Owner view, edit, delete and share the password
  ROLES = %w[viewer editor owner].freeze

  belongs_to :user
  belongs_to :password

  validates :role, presence: :true, inclusion: { in: ROLES }

  attribute :role, default: :viewer

  def editable?
    owner? || editor?
  end

  def shareable?
    owner?
  end

  def deletable?
    owner?
  end

  private

  def owner?
    role == "owner"
  end

  def viewer?
    role == "viewer"
  end

  def editor?
    role == "editor"
  end
end
