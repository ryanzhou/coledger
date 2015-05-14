angular.module("coledger").directive "balanceSheet", ['$location', '$stateParams', 'Resources', 'flash', 'Sheet'
  ($location, $stateParams, Resources, flash, Sheet) ->
    restrict: 'E'
    templateUrl: 'balance/sheet.html'
    scope: {
      projectPromise: '='
    },
    link: ($scope, element, attrs) ->
      $scope.in = new Sheet
      $scope.out = new Sheet

      $scope.project = {}

      $scope.refreshAccounts = ->
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

      $scope.refreshAccounts()
]
