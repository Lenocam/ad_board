require 'carrierwave/test/matchers'

describe FileUploader do
  include CarrierWave::Test::Matchers

  let(:user) { double(FactoryGirl.build(:user), id: "65465465") }
  let(:uploader) { FileUploader.new(user, :image) }

  before do
    FileUploader.enable_processing = true
    File.open("#{Rails.root}/spec/support/images/image.png") { |f| uploader.store!(f) }
    #File.open("#{Rails.root}/spec/support/images/image.gif") { |f| uploader.store!(f) }
    #File.open("#{Rails.root}/spec/support/images/image.jpg") { |f| uploader.store!(f) }
    #File.open("#{Rails.root}/spec/support/images/image.jpeg") { |f| uploader.store!(f) }
  end

  after do
    FileUploader.enable_processing = false
    uploader.remove!
  end

  context 'the thumb version' do
    it "scales down a landscape image to be exactly 50 by 50 pixels" do
      expect(uploader.thumb).to have_dimensions(50, 50)
    end
  end

  context 'the show version' do
    it "scales down a landscape image to fit within 800 by 800 pixels" do
      expect(uploader.show).to be_no_larger_than(800, 800)
    end
  end

  context "the index version" do
    it "scales down to landscape image to be exactly 400 by 400 pixels" do
      expect(uploader.index).to be_no_larger_than(400, 400)
    end
  end
=begin
  it "makes the image readable only to the owner and not executable" do
    expect(uploader).to have_permissions(0600)
  end
=end
  it "has the correct format" do
    expect(uploader).to be_format('png')
  end

end
