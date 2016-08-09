describe User, type: :model do

  it { should have_many(:tags) }

  it "has a valid factory" do
     FactoryGirl.create(:user).should be_valid
   end

  it { should have_many(:decisions) }
end
