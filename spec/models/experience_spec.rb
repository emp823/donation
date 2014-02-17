require 'spec_helper'

describe Experience do
  before { @experience = FactoryGirl.create(:experience) }

  subject { @experience }

  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should respond_to(:contact_name) }

  it { should be_valid }
end
