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
        $scope.user = Resources.User.send_passwd_reset_email({ email:$scope.user.email }, (success) ->
          flash.success = "An email has been sent to you! Please check your inbox and follow the link."
          $location.path('/')
        , (failure) ->
          flash.error = "Invalid email address!"
        )
])
