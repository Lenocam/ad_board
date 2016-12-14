=begin
require 'rails_helper'

RSpec.describe GalleryPolicy do

  #let(:user) { User.new }

  subject { GalleryPolicy.new(user, gallery) }


  #let(:gallery) { FactoryGirl.create(:gallery) }


  context "for a vistor" do

    let(:user) { nil }


    it { should_not permit(:show)}
    it { should_not permit(:index)}
    it { should_not permit(:new)}
    it { should_not permit(:create)}
    it { should_not permit(:update)}
    it { should_not permit(:edit)}
    it { should_not permit(:destroy)}
  end

  context "for a user" do


  end


end
=end
