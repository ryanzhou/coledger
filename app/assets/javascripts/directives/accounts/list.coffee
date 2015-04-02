angular.module("coledger").directive "accountsList", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'accounts/list.html'
  scope: {
    list: '='
    project: '='
    account: '='
    transactions: '='
  }
  link: (scope, element, attrs) ->
    scope.updateList = ->
      Resources.List.update { project_id: scope.project.id, account_id: scope.account.id, id: scope.list.id }, scope.list, (success) ->
        flash.success = "The list has been saved."
]
