angular.module("coledger").controller("AccountsShowController", ['$scope', '$location', '$stateParams', 'Resources', 'flash'
  ($scope, $location, $stateParams, Resources, flash) ->
    $scope.account = {}
    $scope.transactions = []
    $scope.project = Resources.Project.get(id: $stateParams.project_id)
    $scope.refreshAccount = ->
      $scope.accountPromise = Resources.Account.get(project_id: $stateParams.project_id, id: $stateParams.id).$promise
      $scope.accountPromise.then (data) ->
        $scope.account = data

    $scope.updateAccount = ->
      Resources.Account.update { project_id: $scope.project.id, id: $scope.account.id }, $scope.account, (success) ->
        flash.success = "The account has been saved."

    $scope.refreshTransactions = ->
      $scope.transactionsPromise = Resources.Transaction.query(project_id: $routeParams.project_id, account_id: $routeParams.id).$promise
      $scope.transactionsPromise.then (data) ->
        $scope.transactions = data

    $scope.refreshAccount()
    $scope.refreshTransactions()
])
