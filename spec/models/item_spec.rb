require 'spec_helper'

describe Item do
  before { @item = FactoryGirl.create(:item) }

  subject { @item }

  it { should respond_to(:height) }
  it { should respond_to(:width) }
  it { should respond_to(:weight) }

  it { should be_valid }

  it { should have_one(:donation) }

  describe "is invalid with <= 0 height" do
    before { @item.height = -1 }
    it { should_not be_valid }
  end

  describe "is invalid with <= 0 width" do
    before { @item.width = -2 }
    it { should_not be_valid }
  end

  describe "is invalid with <= 0 weight" do
    before { @item.weight = 0 }
    it { should_not be_valid }
  end

end
