angular.module("coledger").directive "accountsTransaction", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'accounts/transaction.html'
  scope: true
  link: (scope, element, attrs) ->
    scope.isOverdue = (transaction) ->
      new Date(transaction.due_date) <= new Date()

    scope.showTransactionModal = ($event) ->
      return if scope.transaction.noClick
      $modal.open
        templateUrl: 'transactions/show.html'
        controller: 'TransactionsShowController'
        size: 'lg'
        resolve:
          transaction: -> scope.transaction
          project: -> scope.$parent.project
          account: -> scope.$parent.account
      .result.then null, (dismiss) ->
        scope.refreshAccount()
        scope.refreshTransactions()
]
