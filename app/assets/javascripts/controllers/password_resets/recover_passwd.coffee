angular.module("coledger").controller("RecoverPasswdController", ['$scope', '$location', '$stateParams', '$window', 'Resources', 'flash',
  ($scope, $location,$stateParams, $window, Resources, flash) ->   
    $scope.user = {}
    $scope.errorMessages =[]

    $scope.schema =
      type: 'object'
      title: 'User'
      properties:
        email:
          hidden: true
          type: 'string'
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
      { type: 'submit', style: 'btn btn-primary', title: 'Reset Password' }]

    $scope.$watch("user.confirmPassword", (value) -> 
      if (value != $scope.user.password)
        $scope.$broadcast('schemaForm.error.confirmPassword', 'matchPassword', "Passwords must match")
      else
        $scope.$broadcast('schemaForm.error.confirmPassword', 'matchPassword', true)
    )
    $scope.submitForm = (form) ->
      $scope.$broadcast("schemaFormValidate")
      email = $location.search().email
      reset_token = $stateParams.reset_token

      if (form.$valid)
        Resources.ResetPassword.update_password({reset_token: reset_token, email: email}, (success) ->
          flash.success = "You have successfully reset your password!"
          $scope.$parent.refreshUser()
        , (failure) ->
          if failure.data.error_code == "VALIDATION_ERROR"
            $scope.errorMessages = failure.data.errors
        )
])
