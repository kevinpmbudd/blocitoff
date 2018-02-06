require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  let(:item) { create(:item, user: user) }

  context "signed in user" do
    before do
      sign_in user
    end

    describe "GET #new" do
      it "returns http success" do
        get :new, params: { user_id: user.id }
        expect(response).to have_http_status :success
      end

      it "renders the #new view" do
        get :new, params: { user_id: user.id }
        expect(response).to render_template :new
      end

      it "instantiates @item" do
        get :new, params: { user_id: user.id }
        expect(assigns(:item)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of Item by 1" do
        expect{ post :create, params: { user_id: user.id, item: { name: "Paint the fence" } } }.to change(Item,:count).by(1)
      end

      it "assigns the new item to @item" do
        post :create, params: { user_id: user.id, item: { name: "Paint the fence" } }
        expect(assigns(:item)).to eq Item.last
      end
    end

    describe "DELETE destroy" do
      it "deletes the item" do
        delete :destroy, params: { user_id: user.id, id: item.id }
        count = Item.where({id: item.id}).size
        expect(count).to eq 0
      end
    end
  end
end
