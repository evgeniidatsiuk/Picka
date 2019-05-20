require 'rails_helper'

RSpec.describe Image, type: :model do

  let!(:user){create(:user)}

  subject{
     build(:image, user: user)
  }

  context "association" do
    it { should belong_to(:user) }
    it { should have_many(:likes) }
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "should not be valid without photos" do
       subject.photos = nil
       expect(subject).to_not be_valid
    end

    describe "not validate description presence" do
    it { is_expected.to_not validate_presence_of(:description) }
  end

  end

end
