module Api
  module V1
    class CategorySerializer < Api::V1::BaseSerializer
      attributes :name, :id

      belongs_to :user
    end
  end
end
