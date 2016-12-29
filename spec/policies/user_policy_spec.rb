describe UserPolicy do
  subject { UserPolicy }

  let(:current_user) { FactoryGirl.build_stubbed :user }
  let(:other_user) { FactoryGirl.build_stubbed :user }
  let(:admin) { FactoryGirl.build_stubbed :user, :admin }

  permissions :index? do
    it "denies access if not an admin" do
      expect(UserPolicy).not_to permit(current_user)
    end
    it 'allows access for an admin' do
      expect(UserPolicy).to permit(admin)
    end
  end

  permissions :show? do
    it 'prevents other_user from seeing profile' do
      expect(subject).not_to permit(current_user, other_user)
    end

    it 'allows owner to see profile' do
      expect(subject).to permit(current_user, current_user)
    end

    it 'allows admin to see profile' do
      expect(subject).to permit(admin)
    end

  end
  permissions :update? do
    it 'prevents updates if not an admin' do
      expect(subject).not_to permit(current_user)
    end

    it 'allows an admin to make updates' do
      expect(subject).to permit(admin)
    end

  end

  permissions :destroy? do
    it 'prevents admin from deleting self' do
      expect(subject).not_to permit(admin, admin)
    end

    it 'prevents destroy if not an admin' do
      expect(subject).not_to permit(current_user, other_user)
    end

    it 'allows destroy if admin' do
      expect(subject).to permit(admin, other_user)
    end
  end
end
