angular.module("coledger").directive "accountsTransaction", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'accounts/transaction.html'
  scope: {
    transaction: '='
  }
  link: (scope, element, attrs) ->
]
