angular.module("coledger").controller("AccountsShowController", ['$scope', '$location', '$routeParams', 'Resources', 'flash'
  ($scope, $location, $routeParams, Resources, flash) ->
    $scope.account = {}
    $scope.project = Resources.Project.get(id: $routeParams.project_id)
    $scope.refreshAccount = ->
      $scope.accountPromise = Resources.Account.get(project_id: $routeParams.project_id, id: $routeParams.id).$promise
      $scope.accountPromise.then (data) ->
        $scope.account = data

    $scope.refreshAccount()

    $scope.updateAccount = ->
      Resources.Account.update { project_id: $scope.project.id, id: $scope.account.id }, $scope.account, (success) ->
        flash.success = "The account has been saved."
])
