module FeatureHelpers

  def auth
    @session = create(:session)
    @user = @session.user
    visit '/#/users/sign_in'
    page.execute_script("window.sessionStorage.setItem('token', '#{@session.token}')")
    page.execute_script("angular.element(document).scope().$broadcast(\"refresh-user\")")
  end

end
