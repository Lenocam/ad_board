module Api
  module V1
    class GallerySerializer < Api::V1::BaseSerializer
      attributes :id, :title

      belongs_to :user
    end
  end
end
