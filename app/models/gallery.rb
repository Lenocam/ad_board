class Gallery < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :title, presence: true, uniqueness: { scope: :user_id }
end
