angular.module("coledger").controller("ForgetPasswdController", ['$scope', '$window', '$location', 'Resources', 'flash', 'state'
  ($scope, $window, $location, Resources, flash) ->
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
        $scope.user = Resources.User.get(email: form[:email]) (success) ->
          flash.success = "An email has been sent to you. Please check your inbox for instruction!"
          $state.go(root)
        , (failure) ->
          if failure.data.error_code == "VALIDATION_ERROR"
            $scope.errorMessages = failure.data.errors
])
