describe User, type: :model do

it { is_expected.to have_many :tags }

it "has a valid factory" do
   FactoryGirl.create(:user).should be_valid
 end
end
