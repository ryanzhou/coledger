angular.module("coledger").directive "projectsAccounts", ['Resources', 'flash', (Resources, flash) ->
  restrict: 'E'
  templateUrl: 'projects/accounts.html'
  scope: true
  link: (scope, element, attrs) ->
    scope.accounts = Resources.Account.query { project_id: $routeParams.id }
]
