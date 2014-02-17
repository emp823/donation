require 'spec_helper'

describe Voucher do
  before { @voucher = FactoryGirl.create(:voucher) }

  subject { @voucher }

  it { should respond_to(:expiration_date) }

  it { should be_valid }
end
