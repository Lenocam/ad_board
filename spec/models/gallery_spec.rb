describe Gallery do
  it "has a valid factory" do
    expect(FactoryGirl.build(:gallery)).to be_valid
  end

  it "is invalid without a title" do
    gallery = FactoryGirl.build(:gallery, title: nil)
    expect(gallery).not_to be_valid
  end

  it "is invalid without a user" do
    gallery = FactoryGirl.build(:gallery, user_id: nil)
    expect(gallery).not_to be_valid
  end

  it "is invalid with duplicate title belonging to same user" do
    FactoryGirl.create(:user, id: 22)
    FactoryGirl.create(:gallery, user_id: 22, title: "Same Title")
    gallery = FactoryGirl.build(:gallery, user_id: 22, title: "Same Title")
    expect(gallery).not_to be_valid
  end

  it "is valid when duplicate title belongs to different users" do
    FactoryGirl.create(:user, id: 22)
    FactoryGirl.create(:user, id:23)
    FactoryGirl.create(:gallery, user_id: 22, title: "Same Title")
    gallery = FactoryGirl.build(:gallery, user_id: 23, title: "Same Title")
    expect(gallery).to be_valid
  end
end
