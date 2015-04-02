angular.module("coledger").controller("AccountsShowController", ['$scope', '$location', '$routeParams', 'Resources', 'flash'
  ($scope, $location, $routeParams, Resources, flash) ->
    $scope.account = {}
    $scope.listTransactions = {}
    $scope.project = Resources.Project.get(id: $routeParams.project_id)
    $scope.refreshAccount = ->
      $scope.accountPromise = Resources.Account.get(project_id: $routeParams.project_id, id: $routeParams.id).$promise
      $scope.accountPromise.then (data) ->
        $scope.account = data

    $scope.updateAccount = ->
      Resources.Account.update { project_id: $scope.project.id, id: $scope.account.id }, $scope.account, (success) ->
        flash.success = "The account has been saved."

    $scope.refreshTransactions = ->
      $scope.transactionsPromise = Resources.Transaction.query(project_id: $routeParams.project_id, account_id: $routeParams.id).$promise
      $scope.transactionsPromise.then (data) ->
        data.map (t) ->
          $scope.listTransactions[t.list_id] ||= []
          $scope.listTransactions[t.list_id].push(t)

    $scope.refreshAccount()
    $scope.refreshTransactions()
])
