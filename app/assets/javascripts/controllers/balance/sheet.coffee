angular.module("coledger").controller("BalanceSheetController", ['$scope', '$location', '$stateParams', 'Resources', 'flash', 'Sheet'
  ($scope, $location, $stateParams, Resources, flash, Sheet) ->
    $scope.in = new Sheet
    $scope.out = new Sheet

    $scope.project = {}

    $scope.refreshProject = ->
      $scope.projectPromise = Resources.Project.get(id: $stateParams.project_id).$promise
      $scope.projectPromise.then (data) ->
        $scope.project = data
        accounts = Resources.Account.query { project_id: data.id }
        accounts.$promise.then (accounts) -> 
          angular.forEach(accounts, (account) ->
            if (account.account_type == "income" || account.account_type == "asset")
              $scope.in.addAccount(account)
            else if (account.account_type == "expense" || account.account_type == "liability")
              $scope.out.addAccount(account)
          )

    $scope.refreshProject()
])
