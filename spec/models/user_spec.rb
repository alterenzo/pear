describe User, type: :model do
  it { should validate_presence_of(:about_me) }
  it { should have_and_belong_to_many(:tags) }
end
