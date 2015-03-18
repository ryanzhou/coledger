angular.module("coledger").controller("SignUpController", ['$scope', '$window', '$location', 'Resources', 'flash'
  ($scope, $window, $location, Resources, flash) ->
    $scope.submitForm = (form) ->
      user = new Resources.User(form)
      user.$save (success) ->
        session = new Resources.Session(username: form.username, password: form.password)
        session.$save (success) ->
          $window.sessionStorage.token = session.token
          flash.success = "You have successfully signed up to CoLedger!"
          $scope.$parent.refreshUser()
          $location.path("/")
      , (failure) ->
        if failure.data.error_code == "VALIDATION_ERROR"
          $scope.alert = failure.data.errors
])
