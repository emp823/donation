def valid_signin(user)
  visit new_session_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
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