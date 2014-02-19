require 'spec_helper'

describe Experience do
  before { @experience = FactoryGirl.create(:experience) }

  subject { @experience }

  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should respond_to(:contact_name) }

  it { should be_valid }

  it { should have_one(:donation) }

  describe "is invalid with invalid latitude" do
    before { @experience.latitude = 200 }
    it { should_not be_valid }
  end

  describe "is invalid with invalid longitude" do
    before { @experience.longitude = -200 }
    it { should_not be_valid }
  end

  describe "is invalid without a contact" do
    before { @experience.contact_name = nil }
    it { should_not be_valid }
  end
end
