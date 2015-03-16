angular.module("coledger").controller("SignInController", ['$scope', '$location', '$window', 'Resources',
  ($scope, $location, $window, Resources) ->
    if $location.search().return_to
      $scope.alert = "You need to sign in to complete the previous action"
    else
      $scope.alert = null

    $scope.submitForm = (form) ->
      $scope.alert = null

      session = new Resources.Session(form)
      session.$save (success) ->
        $window.sessionStorage.token = session.token
        $location.path($location.search().return_to || "/").search('return_to', null)
      , (failure) ->
          if failure.data.error
            $scope.alert = failure.data.error
          if failure.data.error_code == "AUTHENTICATION_ERROR"
            $window.sessionStorage.token = null
            form.password = null
])
