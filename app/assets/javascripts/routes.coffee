angular.module("coledger").config(["$locationProvider", "$stateProvider", "$urlRouterProvider", "$urlMatcherFactoryProvider",
  ($locationProvider, $stateProvider, $urlRouterProvider, $urlMatcherFactoryProvider) ->
    $locationProvider.html5Mode(true)
    $urlMatcherFactoryProvider.strictMode(false)
    states = {
      "home": { url: "", templateUrl: 'index.html', controller: 'IndexController' }
      "users": { url: "/users", template: "<ui-view/>", abstract: true }
      "users.sign_in": { url: "/sign_in", templateUrl: 'users/sign_in.html', controller: 'SignInController' }
      "users.sign_up": { url: "/sign_up", templateUrl: 'users/sign_up.html', controller: 'SignUpController' }
      "users.sign_out": { url: "/sign_out", template: null, controller: 'SignOutController' }
      "users.edit_profile": { url: "/edit_profile", templateUrl: 'users/edit_profile.html', data: { requireLogin: true } }
      "projects": { url: "/projects", template: "<ui-view/>", abstract: true, data: { requireLogin: true } }
      "projects.index": { url: "", templateUrl: 'projects/index.html', controller: 'ProjectsIndexController' }
      "projects.show": { url: "/:id", templateUrl: 'projects/show.html', controller: 'ProjectsShowController' }
      "projects.accounts": { url: "/:project_id/accounts", template: "<ui-view/>", abstract: true }
      "projects.accounts.show": { url: "/:id", templateUrl: 'accounts/show.html', controller: 'AccountsShowController' }
      "projects.accounts.charts": { url: "/:id/charts", templateUrl: 'accounts/charts.html', controller: 'AccountsChartsController' }
    }
    for state, route of states
      $stateProvider.state(state, route)


]).run(['$rootScope', 'Auth', 'flash', '$state', ($rootScope, Auth, flash, $state) ->
  $rootScope.$on "$stateChangeStart", (event, toState) ->
      if toState.data && toState.data.requireLogin && !Auth.isLoggedIn()
        event.preventDefault()
        flash.error = "You need to sign in to complete the previous action"
        $state.go("users.sign_in")
])
