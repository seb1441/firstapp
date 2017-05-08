require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    # @user = User.create!(email: 'test1@gmail.com', password: 'test1122')
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
  end
  describe 'GET #show' do
    context 'User is logged in' do
      before do
        sign_in @user
      end
      it 'loads correct user details' do
        get :show, params: { id: @user.id }, flash: { notice: "Loads correct user details flash message." }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
      context 'User not authorized' do
        it 'redirects to root path' do
          get :show, params: { id: @user2.id }, flash: { notice: "Redirects to root path flash message." }
          expect(response).to redirect_to(root_path)
          expect(response).to have_http_status(302)
          expect(assigns(:user)).not_to eq @user
        end
      end
    end
    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, params: { id: @user.id }, flash: { notice: "Redirects to login flash message." }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end
