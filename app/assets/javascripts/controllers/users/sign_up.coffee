angular.module("coledger").controller("SignUpController", ['$scope', '$window', '$location', 'Resources', 'flash'
  ($scope, $window, $location, Resources, flash) ->
    $scope.user = {}
    $scope.errorMessages = []

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
        confirmPassword:
          title: 'Repeat Password'
          type: 'string'
          minLength: 6
          required: true
        email:
          title: 'Email'
          type: 'string'
          required: true
        first_name:
          title: 'First Name'
          type: 'string'
          required: true
        last_name:
          title: 'Last Name'
          type: 'string'
          required: true

    $scope.form = [
      'username'
      { key: 'password', type: 'password' }
      { key: 'confirmPassword', type: 'password' }
      { key: 'email', type: 'email', validationMessage: "is not a valid email address" }
      { type: 'section', htmlClass: 'row', items: [
          { type: 'section', htmlClass: 'col-sm-6', items: ['first_name'] }
          { type: 'section', htmlClass: 'col-sm-6', items: ['last_name'] }
        ]
      }
      { type: 'submit', style: 'btn btn-primary', title: 'Sign Up'}
    ]

    $scope.$watch("user.confirmPassword", (value) -> 
      if (value != $scope.user.password)
        $scope.$broadcast('schemaForm.error.confirmPassword', 'matchPassword', "Passwords must match")
      else
        $scope.$broadcast('schemaForm.error.confirmPassword', 'matchPassword', true)
    )

    $scope.submitForm = (form) ->
      $scope.$broadcast("schemaFormValidate")
      if (form.$valid)
        user = new Resources.User($scope.user)
        user.$save (success) ->
          session = new Resources.Session(username: $scope.user.username, password: $scope.user.password)
          session.$save (success) ->
            $window.sessionStorage.token = session.token
            flash.success = "You have successfully signed up to CoLedger!"
            $scope.$parent.refreshUser()
            $location.path("/")
        , (failure) ->
          if failure.data.error_code == "VALIDATION_ERROR"
            $scope.errorMessages = failure.data.errors
])
