angular.module("coledger").config(["$routeProvider",
  ($routeProvider) ->
    $routeProvider
      .when("/",
        templateUrl: 'index.html'
        controller: 'HomeController'
      )
      .when("/sign_in",
        templateUrl: 'sign_in.html'
        controller: 'SignInController')
      .when("/sign_up",
        templateUrl: 'sign_up.html'
        controller: 'SignUpController')
])
