angular.module("coledger").controller("SignInController", ['$scope', '$location', '$window', 'Resources', 'flash',
  ($scope, $location, $window, Resources, flash) ->
    $scope.user = {}
    $scope.schema =
      type: 'object'
      title: 'User'
      properties:
        username:
          title: 'Username'
          type: 'string'
          minLength: 3
          required: true
        password:
          title: 'Password'
          type: 'string'
          minLength: 6
          required: true

    $scope.form = [
      'username'
      { key: 'password', type: 'password' }
      { type: 'submit', style: 'btn btn-primary', title: 'Sign In'}
    ]

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
