describe Decision, type: :model do

  it { should validate_presence_of(:by_user) }
  it { should validate_presence_of(:on_user) }
  it { should belong_to(:user) }

end
