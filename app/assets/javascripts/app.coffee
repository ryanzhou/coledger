app = angular.module("coledger", [
  "templates",
  "ngRoute",
  "ngResource"
])

app.factory('authInterceptor', ($rootScope, $q, $window, $location) ->
  request: (request) ->
    request.headers = request.headers || {}
    if ($window.sessionStorage.token)
      request.headers.Authorization = "Token token=\"#{$window.sessionStorage.token}\""
    request
  responseError: (response) ->
    if response.status == 401
      path = $location.path()
      $location.path("/users/sign_in").search('return_to', path)
    $q.reject(response)
)

app.config ($httpProvider) ->
  $httpProvider.interceptors.push('authInterceptor')
