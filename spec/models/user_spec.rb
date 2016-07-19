describe User, type: :model do
  it { should have_and_belong_to_many(:tags) }
end
