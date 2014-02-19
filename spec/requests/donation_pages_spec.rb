require 'spec_helper'

describe "Donation Pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { valid_signin user }

  describe "item creation" do
    before { click_link "Donate an Item" }

    describe "with invalid information" do

      it "should not create a donation" do
        expect { click_button "Create item" }.not_to change(Item, :count)
      end

      describe "error messages" do
        before { click_button "Create item" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { enter_item_donation }
      it "should create an item" do
        expect { click_button "Create item" }.to change(Item, :count).by(1) and change(Donation, :count).by(1)
      end
    end
  end

  describe "voucher creation" do
    before { click_link "Donate a Voucher" }

    describe "with invalid information" do

      it "should not create a donation" do
        expect { click_button "Create voucher" }.not_to change(Voucher, :count)
      end

      describe "error messages" do
        before { click_button "Create voucher" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { enter_voucher_donation }
      it "should create a voucher" do
        expect { click_button "Create voucher" }.to change(Voucher, :count).by(1) and change(Donation, :count).by(1)
      end
    end
  end

  describe "Experience creation" do
    before { click_link "Donate an Experience" }

    describe "with invalid information" do

      it "should not create a donation" do
        expect { click_button "Create experience" }.not_to change(Experience, :count)
      end

      describe "error messages" do
        before { click_button "Create experience" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before { enter_experience_donation }
      it "should create an experience" do
        expect { click_button "Create experience" }.to change(Experience, :count).by(1) and change(Donation, :count).by(1)
      end
    end
  end

end