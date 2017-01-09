module Api
  module V1
    class UserSerializer < Api::V1::BaseSerializer
      attributes :id, :name, :email, :role
      has_many :galleries
      has_many :images
    end
  end
end
