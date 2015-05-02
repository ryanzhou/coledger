angular.module("coledger").config(["$stateProvider", "$urlRouterProvider", "$urlMatcherFactoryProvider",
  ($stateProvider, $urlRouterProvider, $urlMatcherFactoryProvider) ->
    $urlMatcherFactoryProvider.strictMode(false)
    states = {
      "home": { url: "", templateUrl: 'index.html', controller: 'IndexController' }
      "sign_in": { url: "/users/sign_in", templateUrl: 'users/sign_in.html', controller: 'SignInController' }
      "sign_up": { url: "/users/sign_up", templateUrl: 'users/sign_up.html', controller: 'SignUpController' }
      "sign_out": { url: "/users/sign_out", template: null, controller: 'SignOutController' }
      "edit_profile": { url: "/users/edit_profile", templateUrl: 'users/edit_profile.html', data: { requireLogin: true } }
      "projects": { url: "/projects", template: "<ui-view/>", abstract: true, data: { requireLogin: true } }
      "projects.index": { url: "", templateUrl: 'projects/index.html', controller: 'ProjectsIndexController' }
      "projects.show": { url: "/:id", templateUrl: 'projects/show.html', controller: 'ProjectsShowController' }
      "projects.accounts": { url: "/:project_id/accounts", template: "<ui-view/>", abstract: true }
      "projects.accounts.show": { url: "/:id", templateUrl: 'accounts/show.html', controller: 'AccountsShowController' }
    }
    for state, route of states
      $stateProvider.state(state, route)


]).run(['$rootScope', 'Auth', 'flash', '$state', ($rootScope, Auth, flash, $state) ->
  $rootScope.$on "$stateChangeStart", (event, toState) ->
      if toState.data && toState.data.requireLogin && !Auth.isLoggedIn()
        event.preventDefault()
        flash.error = "You need to sign in to complete the previous action"
        $state.go("sign_in")
])
