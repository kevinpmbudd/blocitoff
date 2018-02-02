require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }

  context "guest" do
    it "redirects to sign in" do
      get :show
      expect(response).to redirect_to(new_user_session_path)
    end
  end

  context "signed in user" do
    before do
      sign_in user
    end

    describe "GET #show" do
      it "returns http success" do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
          get :show, params: { id: user.id }
          expect(response).to render_template :show
        end

      it "assigns user to @user" do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq(user)
      end
    end
  end
end
