angular.module("coledger").controller("SignInController", ['$scope', '$location', '$window', 'Resources', 'flash',
  ($scope, $location, $window, Resources, flash) ->
    $scope.user = {}
    $scope.schema = [
      { property: 'username', type: 'text', attr: { ngMinlength: 3, required: true }, columns: 3}
      { property: 'password', type: 'password', attr: { required: true }}
    ]

    $scope.options =
		  validation:
			  enabled: true,
			  showMessages: false
		  layout:
			  type: 'basic'

    $scope.submitForm = (form) ->
      flash.error = null
      session = new Resources.Session($scope.user)
      session.$save (success) ->
        $window.sessionStorage.token = session.token
        $scope.$parent.refreshUser()
        $location.path($location.search().return_to || "/").search('return_to', null)
      , (failure) ->
          if failure.data.error
            flash.error = failure.data.error
          if failure.data.error_code == "AUTHENTICATION_ERROR"
            $window.sessionStorage.token = null
            form.password = null
])
