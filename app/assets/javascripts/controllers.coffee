controllers = angular.module("coledger-controllers", [])

controllers.controller("HomeController", ['$scope',
  ($scope) ->

])

controllers.controller("SignInController", ['$scope', 'Resources',
  ($scope, Resources) ->
    $scope.submitForm = (form) ->
      $scope.success = null
      $scope.alert = null

      session = new Resources.Session
        username: form.username
        password: form.password

      session.$save (success) ->
        # TODO
        $scope.success = "Sign in successful! Your token is: " + session.token
      , (failure) ->
          if failure.data.error
            $scope.alert = failure.data.error
          if failure.data.error_code == "AUTHENTICATION_ERROR"
            form.password = null
])

controllers.controller("SignUpController", ['$scope', 'Resources',
  ($scope, Resources) ->
    $scope.submitForm = (form) ->
      $scope.alert = null

      user = new Resources.User(form)
      user.$save (success) ->
        # TODO
        console.log(user)
      , (failure) ->
        if failure.data.error_code == "VALIDATION_ERROR"
          $scope.alert = failure.data.errors
])
