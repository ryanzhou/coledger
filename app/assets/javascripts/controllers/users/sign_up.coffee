angular.module("coledger").controller("SignUpController", ['$scope', 'Resources',
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
