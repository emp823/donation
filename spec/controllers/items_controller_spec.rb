require 'spec_helper'

describe ItemsController do

  login_user

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  describe "GET new" do
    it "assigns a new item as @item" do
      get :new, {}
      assigns(:item).should be_a_new(Item)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, {:item => valid_item_attributes}
        }.to change(Item, :count).by(1)
      end

      it "assigns a newly created item as @item" do
        post :create, {:item => valid_item_attributes}
        assigns(:item).should be_a(Item)
        assigns(:item).should be_persisted
      end

      it "redirects to the user" do
        post :create, {:item => valid_item_attributes}
        response.should redirect_to(subject.current_user)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved item as @item" do
        Item.any_instance.stub(:save).and_return(false)
        post :create, {:item => { "height" => "invalid value" }}
        assigns(:item).should be_a_new(Item)
      end

      it "re-renders the 'new' template" do
        Item.any_instance.stub(:save).and_return(false)
        post :create, {:item => { "height" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

end
