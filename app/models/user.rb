class User < ApplicationRecord
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?
  validates :name, presence: true

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :galleries, dependent: :destroy

  def generate_auth_token
    token = SecureRandom.hex
    self.update_columns(auth_token: token)
    token
  end

  def invalidate_auth_token
    self.update_columns(auth_token: nil)
  end
end
