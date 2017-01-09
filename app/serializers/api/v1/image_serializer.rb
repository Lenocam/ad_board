module Api
  module V1
    class ImageSerializer < Api::V1::BaseSerializer
      attributes :file

      belongs_to :user
    end
  end
end
