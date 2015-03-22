angular.module("coledger").controller("ProjectsAccountsController", ['$scope', '$location', '$routeParams', 'Resources', 'flash'
  ($scope, $location, $routeParams, Resources, flash) ->
    $scope.project = Resources.Project.get $routeParams
    $scope.currentTab = "accounts"
    $scope.accounts = Resources.Account.query { project_id: $routeParams.id }
])
