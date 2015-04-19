angular.module("coledger").controller("TransactionsShowController", ['$scope', '$modalInstance', 'flash', 'Resources', 'transaction', 'project', 'account'
  ($scope, $modalInstance, flash, Resources, transaction, project, account) ->
    $scope.transaction = transaction

    $scope.updateTransaction = ->
      $scope.transaction.amount = $scope.transaction.amount.decimal
      Resources.Transaction.update { project_id: project.id, account_id: account.id, id: transaction.id }, $scope.transaction, (success) ->
        flash.success = "Transaction has been saved."
        $scope.transaction = success
      , (failure) ->
        flash.error = "Transaction cannot be saved due to an error."
    $scope.cancel = ->
      $modalInstance.dismiss('cancel')

    $scope.transactionParams = { project_id: project.id, account_id: account.id, transaction_id: transaction.id }

])
