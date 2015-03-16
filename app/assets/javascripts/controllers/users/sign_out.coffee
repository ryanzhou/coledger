angular.module("coledger").controller("SignOutController", ['$scope', '$location', '$window', 'Resources',
  ($scope, $location, $window, Resources) ->
    Resources.Session.delete(id: 'current', (data) ->
      $window.sessionStorage.token = null
      $location.path("/users/sign_in")
      $scope.$parent.refreshUser()
    )
])
