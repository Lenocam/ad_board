describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it 'is invalid without a name' do
    user = FactoryGirl.build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it 'is invalid without an email address' do
    user = FactoryGirl.build(:user, email: nil)
    expect(user).not_to be_valid
  end

  it 'is invalid with a duplicate email address' do
    FactoryGirl.create(:user, email: "example@example.com")
    user = FactoryGirl.build(:user, email: "example@example.com")
    expect(user).not_to be_valid
  end
end
