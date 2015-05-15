angular.module("coledger").directive "balanceResult", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'balance/result.html'
  scope: {
    in: '=',
    out: '=',
    currency: '='
  }
  link: (scope, element, attrs) ->
]
