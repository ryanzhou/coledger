angular.module("coledger").controller("SignUpController", ['$scope', '$window', '$location', 'Resources', 'flash'
  ($scope, $window, $location, Resources, flash) ->
    $scope.user = {}
    $scope.schema = [
      { property: 'username', type: 'text', attr: { ngMinlength: 3, required: true }, columns: 3}
      { property: 'password', type: 'password', attr: { required: true }}
      { property: 'email', type: 'email', attr: { required: true }}
      { type: 'multiple', fields: [
        { property: 'first_name', label: 'First Name', type: 'text', attr: { required: true }}
        { property: 'last_name', label: 'Last Name', type: 'text', attr: { required: true }}
      ], columns: 6}
    ]

    $scope.options =
		  validation:
			  enabled: true,
			  showMessages: true
		  layout:
			  type: 'basic'

    $scope.submitForm = (form) ->
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
          form.errorMessages = failure.data.errors
])
