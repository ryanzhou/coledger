angular.module("coledger").directive "accountsList", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'accounts/list.html'
  scope: {
    list: '='
  }
  link: (scope, element, attrs) ->
    scope.list
]
