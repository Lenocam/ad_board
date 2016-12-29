feature "User profile page", :devise do
  scenario "user sees their own profile" do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
    visit user_path(user)
    expect(page).to have_content user.email
  end
end
