angular.module("coledger").directive "balanceAccounts", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'balance/accounts.html'
  scope: {
    sheet: '=',
    project: '='
  }
  link: (scope, element, attrs) ->
]
