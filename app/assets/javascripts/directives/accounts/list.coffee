angular.module("coledger").directive "accountsList", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'accounts/list.html'
  link: (scope, element, attrs) ->
    scope.$watch 'transactions', ->
      scope.listTransactions = scope.transactions.filter (t) ->
        t.list_id == scope.list.id
    scope.updateList = ->
      Resources.List.update { project_id: scope.project.id, account_id: scope.account.id, id: scope.list.id }, scope.list, (success) ->
        flash.success = "The list has been saved."
]
