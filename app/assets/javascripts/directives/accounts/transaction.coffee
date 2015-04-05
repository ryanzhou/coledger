angular.module("coledger").directive "accountsTransaction", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'accounts/transaction.html'
  scope: {
    transaction: '='
  }
  link: (scope, element, attrs) ->
    scope.showTransactionModal = ($event) ->
      return if scope.transaction.noClick
      $modal.open
        templateUrl: 'transactions/show.html'
        controller: 'TransactionsShowController'
        resolve:
          transaction: -> scope.transaction
          project: -> scope.$parent.project
          account: -> scope.$parent.account
      .result.then (data) ->
        $scope.refreshTransactions()
]
