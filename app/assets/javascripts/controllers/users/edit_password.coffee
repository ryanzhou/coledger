angular.module("coledger").controller("EditPasswordController", ['$scope', '$location', '$window', 'Resources', 'flash',
  ($scope, $location, $window, Resources, flash) ->
    $scope.user = Resources.User.get(id: "current")

    $scope.schema =
      type: 'object'
      title: 'User'
      properties:
        password:
          title: 'Password'
          type: 'string'
          minLength: 6
          required: true
        confirmPassword:
          title: 'Repeat Password'
          type: 'string'
          minLength: 6
          required: true

    $scope.form = [
      { key: 'password', type: 'password' }
      { key: 'confirmPassword', type: 'password' }
      { type: 'submit', style: 'btn btn-primary', title: 'Update Password' }]

    $scope.$watch("user.confirmPassword", (value) -> 
      if (value != $scope.user.password)
        $scope.$broadcast('schemaForm.error.confirmPassword', 'matchPassword', "Passwords must match")
      else
        $scope.$broadcast('schemaForm.error.confirmPassword', 'matchPassword', true)
    )
    $scope.submitForm = (form) ->
      $scope.$broadcast("schemaFormValidate")
      if (form.$valid)
        Resources.User.update(id: "current", $scope.user, (success) ->
          flash.success = "You have successfully updated your password!"
          $scope.$parent.refreshUser()
        , (failure) ->
          if failure.data.error_code == "VALIDATION_ERROR"
            $scope.errorMessages = failure.data.errors
        )
])
