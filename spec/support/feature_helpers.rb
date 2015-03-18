module FeatureHelpers

  def auth
    @session = create(:session)
    @user = @session.user
    visit '#/users/sign_in'
    page.execute_script("window.sessionStorage.setItem('token', '#{@session.token}')")
  end

end
