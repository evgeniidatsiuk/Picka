require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context "association" do
    it { should belong_to(:follower) }
    it { should belong_to(:followed) }
  end
end
