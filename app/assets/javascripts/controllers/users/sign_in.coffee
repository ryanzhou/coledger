angular.module("coledger").controller("SignInController", ['$scope', '$location', '$window', 'Resources', 'flash',
  ($scope, $location, $window, Resources, flash) ->
    $scope.submitForm = (form) ->
      flash.error = null

      session = new Resources.Session(form)
      session.$save (success) ->
        $window.sessionStorage.token = session.token
        $scope.$parent.refreshUser()
        $location.path($location.search().return_to || "/").search('return_to', null)
      , (failure) ->
          if failure.data.error
            flash.error = failure.data.error
          if failure.data.error_code == "AUTHENTICATION_ERROR"
            $window.sessionStorage.token = null
            form.password = null
])
