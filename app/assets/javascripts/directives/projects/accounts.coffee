angular.module("coledger").directive "projectsAccounts", ['Resources', 'flash', '$modal', '$timeout', (Resources, flash, $modal, $timeout) ->
  restrict: 'E'
  templateUrl: 'projects/accounts.html'
  scope: true
  link: (scope, element, attrs) ->
    scope.accounts = []

    scope.refreshAccounts = ->
      scope.projectPromise.then (data) ->
        scope.accounts = Resources.Account.query { project_id: data.id }
        scope.accounts.$promise.then (data) ->
          scope.loadFlipster()

    scope.refreshAccounts()
    scope.loadFlipster = () ->
      $timeout ->
        $('.flipster').flipster(style: 'carousel')
      , 0

    scope.newAccountModal = ->
      $modal.open
        templateUrl: 'accounts/new.html'
        controller: 'AccountsNewController'
        resolve:
          project: -> scope.project
      .result.then (account) ->
        scope.refreshAccounts()

    scope.showArchivedAccounts = false

    scope.archiveAccount = (account) ->
      account.archived = true
      Resources.Account.update { project_id: scope.project.id, id: account.id }, account, (success) ->
        account = success

    scope.restoreAccount = (account) ->
      account.archived = false
      Resources.Account.update { project_id: scope.project.id, id: account.id }, account, (success) ->
        account = success

]
