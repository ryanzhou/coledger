angular.module("coledger").controller("HomeController", ['$scope', '$location', 'Resources'
  ($scope, $location, Resources) ->
    user = Resources.User
    $scope.user = user.get(id: 'current')
    console.log($scope.user)
])
