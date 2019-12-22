require 'rails_helper'

RSpec.describe Admin::MoviesController, type: :controller do
  describe 'only admin can see /admin' do
    it "user should be redirected to /" do
      user_login
      get :index
      expect(response).to redirect_to(root_path)
    end
  end
end
