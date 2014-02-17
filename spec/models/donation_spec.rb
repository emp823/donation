require 'spec_helper'

describe Donation do
  let(:item_donation) { FactoryGirl.create(:item_donation) }
  let(:voucher_donation) { FactoryGirl.create(:voucher_donation) }
  let(:experience_donation) { FactoryGirl.create(:experience_donation) }
end
