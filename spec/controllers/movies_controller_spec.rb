# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe 'POST #rating' do
    it 'should redirect to unauthorized users/sign_in' do
      post :rating, params: { id: create(:movie).id, rating: 6 }
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'should redirect authorized user to root path' do
      user_login
      post :rating, params: { id: create(:movie).id, rating: 6 }
      expect(response).to redirect_to(root_path)
    end

    it 'should get 404 when movie ont found' do
      user_login
      post :rating, params: { id: 0, rating: 1 }
      expect(response).to have_http_status(:not_found)
    end
  end
end
