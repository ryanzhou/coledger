angular.module("coledger").config(["$routeProvider",
  ($routeProvider) ->
    $routeProvider
      .when("/", templateUrl: 'index.html')
      .when("/users/edit_profile", templateUrl: 'users/edit_profile.html')
      .when("/users/sign_in", templateUrl: 'users/sign_in.html', controller: 'SignInController')
      .when("/users/sign_up", templateUrl: 'users/sign_up.html', controller: 'SignUpController')
      .when("/users/sign_out", template: null, controller: 'SignOutController')
      .when("/projects", templateUrl: 'projects/list.html', controller: 'ProjectsController')
      .when("/projects/:id", templateUrl: 'projects/show.html', controller: 'ProjectsShowController')
      .when("/projects/:project_id/accounts/:id", templateUrl: 'accounts/show.html', controller: 'AccountsShowController')
])
