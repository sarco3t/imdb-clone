module LoginHelper
  def user_login
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in create(:user)
  end

  def admin_login
    @request.env['devise.mapping'] = Devise.mappings[:user]
    sign_in create(:user, :admin)
  end
end