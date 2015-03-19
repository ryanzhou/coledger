angular.module("coledger").config(["$routeProvider",
  ($routeProvider) ->
    $routeProvider
      .when("/", templateUrl: 'index.html', controller: 'ProjectsController')
      .when("/users/edit_profile", templateUrl: 'users/edit_profile.html', controller: 'EditProfileController')
      .when("/users/sign_in", templateUrl: 'users/sign_in.html', controller: 'SignInController')
      .when("/users/sign_up", templateUrl: 'users/sign_up.html', controller: 'SignUpController')
      .when("/users/sign_out", template: null, controller: 'SignOutController')
      .when("/projects/:id", templateUrl: 'projects/accounts.html', controller: 'ProjectsAccountsController')
      .when("/projects/:id/members", templateUrl: 'projects/members.html', controller: 'ProjectsMembersController')
      .when("/projects/:id/settings", templateUrl: 'projects/settings.html', controller: 'ProjectsSettingsController')
])
