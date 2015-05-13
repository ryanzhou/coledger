angular.module("coledger").controller("ForgetPasswdController", ['$scope', '$window', '$location', 'Resources', 'flash'
  ($scope, $window, $location, Resources, flash) ->
    $scope.user = {}
    $scope.errorMessages = []

    $scope.schema =
      type: 'object'
      title: 'User'
      properties:
        email:
          title: 'Email'
          type: 'string'
          required: true
        

    $scope.form = [
      { key: 'email', type: 'email', validationMessage: "is not a valid email address" }
      { type: 'submit', style: 'btn btn-primary', title: 'Submit'}
    ]

    $scope.submitForm = (form) ->
      $scope.$broadcast("schemaFormValidate")
      if (form.$valid)
        $scope.user = Resources.User.get(email: $scope.email, (success) ->
          $scope.user.send_passwd_reset_email
          flash.success = "You have successfully updated your profile!"
          $localtion.path(home)
        , (failure) ->
          flash.error = "Your email is invalid. Please try again!"
        )
])
