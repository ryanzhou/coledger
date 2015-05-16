angular.module("coledger").controller("TransactionsShowController", ['$scope', '$modalInstance', 'flash', 'Resources', 'transaction', 'project', 'account'
  ($scope, $modalInstance, flash, Resources, transaction, project, account) ->
    $scope.transaction = angular.copy(transaction)
    $scope.memberships = project.memberships

    $scope.parseTransactionDate = ->
      $scope.transaction.parsed_due_date = new Date($scope.transaction.due_date) if $scope.transaction.due_date

    $scope.updateTransaction = ->
      $scope.transaction.amount = $scope.transaction.amount.decimal
      $scope.transaction.due_date = $scope.transaction.parsed_due_date
      Resources.Transaction.update { project_id: project.id, account_id: account.id, id: transaction.id }, $scope.transaction, (success) ->
        flash.success = "Transaction has been saved."
        $scope.transaction.amount = success.amount
        $scope.transaction.assignee = success.assignee
      , (failure) ->
        flash.error = "Transaction cannot be saved due to an error."
    $scope.cancel = ->
      $modalInstance.dismiss('cancel')

    $scope.deleteTransaction = ->
      Resources.Transaction.delete { project_id: project.id, account_id: account.id, id: transaction.id }, (success) ->
        flash.success = "Transaction has been deleted."
        $modalInstance.dismiss('cancel')
      , (failure) ->
        flash.error = "Transaction does not exist, or you are not authorized to perform this action."

    $scope.transactionParams = { project_id: project.id, account_id: account.id, transaction_id: transaction.id }

    $scope.parseTransactionDate()

    $scope.$watch 'transaction.parsed_due_date', (newVal, oldVal) ->
      if newVal? && oldVal != newVal && $scope.transaction.parsed_due_date != new Date($scope.transaction.due_date)
        $scope.updateTransaction()
    , true
])
