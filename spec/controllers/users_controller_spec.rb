require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user, email: "t@t", id: 1) }

  describe 'GET #show' do
    it "should find and show user" do
      get :show, params: { id: user.id }
      expect(assigns(:user)).to_not be_nil
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #index' do
    it "should show all users" do
      get :index
      expect(assigns(:users)).to_not be_nil
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #followers' do
    it "should show all followers" do
      get :followers, params: { id: user.id }
      expect(assigns(:users)).to_not be_nil
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET #index' do
    it "should show all following" do
      get :following, params: { id: user.id }
      expect(assigns(:users)).to_not be_nil
      expect(response).to have_http_status(200)
    end
  end

end
