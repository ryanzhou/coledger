angular.module("coledger").controller("SignInController", ['$scope', 'Resources',
  ($scope, Resources) ->
    $scope.submitForm = (form) ->
      $scope.success = null
      $scope.alert = null

      session = new Resources.Session(form)

      session.$save (success) ->
        # TODO
        $scope.success = "Sign in successful! Your token is: " + session.token
      , (failure) ->
          if failure.data.error
            $scope.alert = failure.data.error
          if failure.data.error_code == "AUTHENTICATION_ERROR"
            form.password = null
])
