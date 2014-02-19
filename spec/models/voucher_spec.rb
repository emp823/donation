require 'spec_helper'

describe Voucher do
  before { @voucher = FactoryGirl.create(:voucher) }

  subject { @voucher }

  it { should respond_to(:expiration_date) }

  it { should be_valid }

  it { should have_one(:donation) }

  describe "is invalid with a past expiration date" do
    before { @voucher.expiration_date = Date.today - 1 }
    it { should_not be_valid }
  end

end
