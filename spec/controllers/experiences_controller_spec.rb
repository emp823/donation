require 'spec_helper'

describe ExperiencesController do

  login_user

  it "should have a current_user" do
    subject.current_user.should_not be_nil
  end

  describe "GET new" do
    it "assigns a new experience as @experience" do
      get :new, {}
      assigns(:experience).should be_a_new(Experience)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new experience" do
        expect {
          post :create, {:experience => valid_experience_attributes}
        }.to change(Experience, :count).by(1)
      end

      it "assigns a newly created experience as @experience" do
        post :create, {:experience => valid_experience_attributes}
        assigns(:experience).should be_a(Experience)
        assigns(:experience).should be_persisted
      end

      it "redirects to the user" do
        post :create, {:experience => valid_experience_attributes}
        response.should redirect_to(subject.current_user)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved experience as @experience" do
        Experience.any_instance.stub(:save).and_return(false)
        post :create, {:experience => { "height" => "invalid value" }}
        assigns(:experience).should be_a_new(Experience)
      end

      it "re-renders the 'new' template" do
        Experience.any_instance.stub(:save).and_return(false)
        post :create, {:experience => { "height" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end

end
