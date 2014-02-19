require 'spec_helper'

describe Item do
  before { @item = FactoryGirl.create(:item) }

  subject { @item }

  it { should respond_to(:height) }
  it { should respond_to(:width) }
  it { should respond_to(:weight) }

  it { should be_valid }

  it { should have_one(:donation) }

  describe "is invalid without a height" do
    before { @item.height = nil }
    it { should_not be_valid }
  end

  describe "is invalid without a width" do
    before { @item.width = nil }
    it { should_not be_valid }
  end

  describe "is invalid without a weight" do
    before { @item.weight = nil }
    it { should_not be_valid }
  end

end
