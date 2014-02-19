require 'spec_helper'

describe "StaticPages" do
  
  describe "Home page" do
    it "should have the content 'donator'" do
      visit root_path
      page.should have_content('Donator')
    end

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        valid_signin(user)
        visit root_path
      end

      it "should show donation buttons" do
        page.should have_content('Voucher')
        page.should have_content('Item')
        page.should have_content('Experience')
      end
    end
  end
end