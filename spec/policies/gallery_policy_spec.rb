require 'rails_helper'

RSpec.describe GalleryPolicy do
  #Pretty sure I skipped over this because I kept getting errors
  #saying user and gallery were undefined variables
  subject { GalleryPolicy.new(user, gallery) }

  context "for a vistor" do
    it "has(gallery) a valid factory" do
      expect(FactoryGirl.build(:gallery)).to be_valid
    end

      it 'has(user) a valid factory' do #passes I know why
        expect(FactoryGirl.build(:user)).to be_valid
      end

      permissions :show? do #passes but I don't know why
        it "denies access to show if vistor" do
          expect(GalleryPolicy).not_to permit(FactoryGirl.build(:user, id: nil), FactoryGirl.create(:gallery))
        end
      end
  end

  context "for a user" do

  end
end
