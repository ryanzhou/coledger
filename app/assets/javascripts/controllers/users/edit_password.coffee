angular.module("coledger").controller("EditPasswordController", ['$scope', '$location', '$window', 'Resources', 'flash',
  ($scope, $location, $window, Resources, flash) ->
    $scope.user = Resources.User.get(id: "current")

    $scope.schema =
      type: 'object'
      title: 'User'
      properties:
        current_password:
          title: 'Current Password'
          type: 'string'
          minLength: 6
          required: true
        password:
          title: 'New Password'
          type: 'string'
          minLength: 6
          required: true
        confirm_password:
          title: 'Repeat New Password'
          type: 'string'
          minLength: 6
          required: true

    $scope.form = [
      { key: 'current_password', type: 'password' }
      { key: 'password', type: 'password' }
      { key: 'confirm_password', type: 'password' }
      { type: 'submit', style: 'btn btn-primary', title: 'Update Password' }]
    $scope.$watch("user.current_password", (value) ->
      if (!value)
        #Form possibly set to pristine, ignore
        return
      else
        $scope.$broadcast('schemaForm.error.current_password', 'incorrect', true)
    )
    $scope.$watch("user.confirm_password", (value) -> 
      if (!value)
        #Form possibly set to pristine, ignore
        return
      else if (value != $scope.user.password)
        $scope.$broadcast('schemaForm.error.confirm_password', 'matchPassword', "Passwords must match")
      else
        $scope.$broadcast('schemaForm.error.confirm_password', 'matchPassword', true)
    )
    $scope.submitForm = (form) ->
      $scope.$broadcast("schemaFormValidate")
      if (form.$valid)
        Resources.User.update(id: "current", $scope.user, (success) ->
          flash.success = "You have successfully updated your password!"
          $scope.user = {}
          form.$setPristine()
          $scope.$parent.refreshUser()
        , (failure) ->
          if failure.data.error_code == "VALIDATION_ERROR"
            $scope.errorMessages = failure.data.errors
        )
])
