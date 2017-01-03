module Api
  module V1
    class UserSerializer < Api::V1::BaseSerializer
      attributes :id, :name, :email, :role

    end
  end
end
