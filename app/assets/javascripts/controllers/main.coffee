angular.module("coledger").controller("MainController", ['$scope', '$rootScope', '$state', 'Auth', 'Resources'
  ($scope, $rootScope, $state, Auth, Resources) ->

    $scope.state = $state
    $scope.refreshUser = ->
      if Auth.isLoggedIn()
        $scope.currentUser = Resources.User.get(id: 'current', (data) ->
          $scope.currentUser = data).$promise
        Resources.Session.get id: 'current', (data) ->
          $scope.currentSession = data
      else
        $scope.currentUser = null

    $scope.refreshUser()
    $rootScope.$on "refresh-user", ->
      $scope.refreshUser()
])
