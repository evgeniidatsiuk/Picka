require 'rails_helper'

RSpec.describe Like, type: :model do
  context "association" do
    it { should belong_to(:user) }
    it { should belong_to(:image) }
  end
end
