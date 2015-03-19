angular.module("coledger").controller("UserPanel", ['$scope', '$log'
  ($scope, $log) ->
    $scope.isOpen = false
    $scope.toggled = (open) ->
      $scope.isOpen = open
])


