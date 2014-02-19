require 'spec_helper'

describe "Donation Pages" do
  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  before { make_experience(user) }

  describe "visit user profile" do
    describe "with valid information" do
      it "should have experience recorded" do
        page.should have_content('Donations')
        page.should have_content('Map')
        page.should have_content('Experience123')
      end
    end
  end

end