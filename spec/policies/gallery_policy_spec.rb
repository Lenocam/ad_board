describe GalleryPolicy do
  subject { GalleryPolicy }

  let(:current_user) { FactoryGirl.build_stubbed :user }
  let(:other_user) { FactoryGirl.build_stubbed :user }
  let(:admin) { FactoryGirl.build_stubbed :user, :admin }

  permissions :index? do
    it 'denies other_user from seeing current_user index' do
      expect(subject).not_to permit(current_user, other_user)
    end
    it 'allows owner to see gallery' do
      expect(subject).to permit(current_user)
    end
  end

end
