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
      $scope.transactionsPromise = Resources.Transaction.query(project_id: $stateParams.project_id, account_id: $stateParams.id).$promise
      $scope.transactionsPromise.then (data) ->
        $scope.transactions = data

    $scope.moveTransaction = (transaction, list) ->
      candidate = $scope.transactions.filter((t) -> t.id == transaction.id)[0]
      candidate.list_id = list.id
      Resources.Transaction.update { project_id: $scope.project.id, account_id: $scope.account.id, id: transaction.id }, { list_id: list.id }

    $scope.refreshAccount()
    $scope.refreshTransactions()
])
