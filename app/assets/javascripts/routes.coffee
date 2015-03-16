angular.module("coledger").config(["$routeProvider",
  ($routeProvider) ->
    $routeProvider
      .when("/",
        templateUrl: 'index.html'
        controller: 'HomeController'
      )
      .when("/users/sign_in",
        templateUrl: 'users/sign_in.html'
        controller: 'SignInController'
      )
      .when("/users/sign_up",
        templateUrl: 'users/sign_up.html'
        controller: 'SignUpController'
      )
])
