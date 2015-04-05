angular.module("coledger").directive "accountsList", ['Resources', 'flash', '$modal', '$timeout', (Resources, flash, $modal, $timeout) ->
  restrict: 'E'
  templateUrl: 'accounts/list.html'
  link: (scope, element, attrs) ->
    scope.$watch('transactions', ->
      console.log("changed")
      scope.listTransactions = scope.transactions.filter (t) ->
        t.list_id == scope.list.id
    , true)
    scope.updateList = ->
      Resources.List.update { project_id: scope.project.id, account_id: scope.account.id, id: scope.list.id }, scope.list, (success) ->
        flash.success = "The list has been saved."

    scope.onDragStart = ($data) ->
      $data.noClick = true

    scope.onDragComplete = ($data) ->
      if $data.noClick
        $timeout ->
          $data.noClick = false
        , 100

    scope.onDropComplete = ($data, list) ->
      scope.moveTransaction($data, list)
]
