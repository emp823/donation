def valid_signin(user)
  visit new_user_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  visit root_path
end

def login_user
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end
end

def valid_item_attributes
  { "height" => 1, "weight" => 1, "width" => 1 }
end

def valid_experience_attributes
  { "latitude" => 30.00, "longitude" => 30.00, "contact_name" => "Dave" }
end

def valid_voucher_attributes
  { "expiration_date" => Date.today + 30 }
end

def enter_item_donation
  fill_in 'Height', with: 2
  fill_in 'Width', with: 2
  fill_in 'Weight', with: 2
  fill_in 'Title', with: "Test"
  fill_in 'Description', with: "Test"
end

def enter_voucher_donation
  fill_in 'Expiration Date', with: Date.today + 30
  fill_in 'Title', with: "Test"
  fill_in 'Description', with: "Test"
end

def enter_experience_donation
  fill_in 'Latitude', with: 2.00
  fill_in 'Longitude', with: 2.00
  fill_in 'Contact Name', with: "Me"
  fill_in 'Title', with: "Test"
  fill_in 'Description', with: "Test"
end