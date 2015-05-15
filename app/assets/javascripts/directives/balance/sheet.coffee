angular.module("coledger").directive "balanceSheet", ['$location', '$stateParams', 'Resources', 'flash', 'Sheet'
  ($location, $stateParams, Resources, flash, Sheet) ->
    restrict: 'E'
    templateUrl: 'balance/sheet.html'
    scope: {
      projectPromise: '=',
      typeIn: '@',
      typeOut: '@'
    },
    link: ($scope, element, attrs) ->
      $scope.in = new Sheet($scope.typeIn)
      $scope.out = new Sheet($scope.typeOut)

      $scope.project = {}

      $scope.refreshAccounts = ->
        $scope.projectPromise.then (data) ->
          $scope.project = data
          accounts = Resources.Account.query { project_id: data.id }
          accounts.$promise.then (accounts) -> 
            angular.forEach(accounts, (account) ->
              if (account.account_type == $scope.typeIn)
                $scope.in.addAccount(account)
              else if (account.account_type == $scope.typeOut)
                $scope.out.addAccount(account)
            )

      $scope.refreshAccounts()
]
