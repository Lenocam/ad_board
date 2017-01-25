=begin
FactoryGirl.define do
  factory :image do
    path_to_file =  "#{Rails.root}/spec/support/images/image.png"


    file { File.open(path_to_file) {|f| FileUploader.store!(f) }}

    association :user
  end
end
=end
