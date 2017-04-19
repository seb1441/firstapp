require 'rails_helper'

describe UsersController, :type => :controller do

    before do
      @user = User.create!(email: 'test1@gmail.com', password: 'test1122')
      @user2 = User.create!(email: 'test2@gmail.com', password: 'test1122')
      sign_in @user
    end
    describe "GET #show" do
      context 'User is logged in' do
        it 'loads correct user details' do
          get :show, id: @user.id
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq @user
        end
      end
     end
      context 'No user is logged in' do
        it 'redirects to login' do
          get :show, id: @user.id
          expect(response).to redirect_to(root_path)
        end
      end
      context 'User not authorized' do
      	it 'redirects to root path' do
      	  get :show, id: @user2.id
      	  expect(response).to redirect_to(root_path)
      	  expect(response).to have_http_status(401)
      	  expect(assigns(:user)).to not_eq @user2
        end
      end

end
