require 'spec_helper'

describe Donation do
  let(:item_donation) { FactoryGirl.create(:item_donation) }
  let(:voucher_donation) { FactoryGirl.create(:voucher_donation) }
  let(:experience_donation) { FactoryGirl.create(:experience_donation) }

  subject { item_donation }

  describe "accessible attributes" do
    it { should respond_to(:user) }
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:donatable_type) }
    it { should respond_to(:donatable_id) }

    it { should be_valid }

    it { should belong_to(:donatable) }
  end

  subject { voucher_donation }

  describe "accessible attributes" do
    it { should respond_to(:user) }
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:donatable_type) }
    it { should respond_to(:donatable_id) }

    it { should be_valid }

    it { should belong_to(:donatable) }
  end

  subject { experience_donation }

  describe "accessible attributes" do
    it { should respond_to(:user) }
    it { should respond_to(:title) }
    it { should respond_to(:description) }
    it { should respond_to(:donatable_type) }
    it { should respond_to(:donatable_id) }

    it { should be_valid }

    it { should belong_to(:donatable) }
  end

end
