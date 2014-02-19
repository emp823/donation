require 'spec_helper'

describe VouchersController do
  login_user

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  describe "GET new" do
    it "assigns a new voucher as @voucher" do
      get :new, {}
      assigns(:voucher).should be_a_new(Voucher)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new voucher" do
        expect {
          post :create, {:voucher => valid_voucher_attributes}
        }.to change(Voucher, :count).by(1)
      end

      it "assigns a newly created voucher as @voucher" do
        post :create, {:voucher => valid_voucher_attributes}
        assigns(:voucher).should be_a(Voucher)
        assigns(:voucher).should be_persisted
      end

      it "redirects to the user" do
        post :create, {:voucher => valid_voucher_attributes}
        response.should redirect_to(subject.current_user)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved voucher as @voucher" do
        Voucher.any_instance.stub(:save).and_return(false)
        post :create, {:voucher => { "height" => "invalid value" }}
        assigns(:voucher).should be_a_new(Voucher)
      end

      it "re-renders the 'new' template" do
        Voucher.any_instance.stub(:save).and_return(false)
        post :create, {:voucher => { "height" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

end
