app = angular.module("coledger", [
  "templates",
  "ngRoute",
  "ngResource",
  "angular-flash.service",
  "angular-flash.flash-alert-directive",
  "ui.bootstrap",
  "schemaForm"
])

app.factory('authInterceptor', ['$rootScope', '$q', '$window', '$location', 'flash', ($rootScope, $q, $window, $location, flash) ->
  request: (request) ->
    request.headers = request.headers || {}
    if ($window.sessionStorage.token)
      request.headers.Authorization = "Token token=\"#{$window.sessionStorage.token}\""
    request
  responseError: (response) ->
    if response.status == 401
      path = $location.path()
      if !$location.path().match(/^\/users\//)
        flash.error = "You need to sign in to complete the previous action"
        $location.path("/users/sign_in").search('return_to', path)
    $q.reject(response)
])

app.config ["$httpProvider", ($httpProvider) ->
  $httpProvider.interceptors.push('authInterceptor')
]

app.config ["flashProvider", (flashProvider) ->
  flashProvider.errorClassnames.push('alert-danger')
  flashProvider.successClassnames.push('alert-success')
  flashProvider.warnClassnames.push('alert-warn')
  flashProvider.infoClassnames.push('alert-info')
]
