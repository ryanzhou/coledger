angular.module("coledger").controller("UserPanelController", ['$scope', '$log'
  ($scope, $log) ->
    $scope.isOpen = false
    $scope.toggled = (open) ->
      $scope.isOpen = open
])


