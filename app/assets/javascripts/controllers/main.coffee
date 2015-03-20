angular.module("coledger").controller("MainController", ['$scope', '$rootScope', '$location', 'Resources'
  ($scope, $rootScope, $location, Resources) ->

    $scope.refreshUser = ->
      Resources.User.get(id: 'current', (data) ->
        $scope.currentUser = data
      , (failure) ->
        $scope.currentUser = null
      )
      Resources.Session.get(id: 'current', (data) ->
        $scope.currentSession = data
      , (failure) ->
        $scope.currentSession = null
      )

    $scope.refreshUser()
    $rootScope.$on "refresh-user", ->
      $scope.refreshUser()
])
