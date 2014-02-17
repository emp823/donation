require 'spec_helper'

describe Item do
  before { @item = FactoryGirl.create(:item) }

  subject { @item }

  it { should respond_to(:height) }
  it { should respond_to(:width) }
  it { should respond_to(:weight) }

  it { should be_valid }
end
