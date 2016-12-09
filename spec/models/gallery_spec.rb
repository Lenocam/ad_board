describe Gallery do

  before(:each) { @gallery = Gallery.new(title: 'Gallery Title Here')}

  subject { @gallery }

  it { should respond_to(:title) }

  it '#title returns a string' do
    expect(@gallery.title).to match 'Gallery Title Here'
  end

end
