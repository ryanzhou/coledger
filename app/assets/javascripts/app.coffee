app = angular.module("coledger", [
  "ui.router",
  "ngResource",
  "angular-flash.service",
  "angular-flash.flash-alert-directive",
  "ui.bootstrap",
  "schemaForm",
  "xeditable",
  "ngDraggable",
  "templates"
])

app.factory('authInterceptor', ['$rootScope', '$timeout', '$q', '$window', '$injector', 'flash', ($rootScope, $timeout, $q, $window, $injector, flash) ->
  # this trick must be done so that we don't receive
  # `Uncaught Error: [$injector:cdep] Circular dependency found`
  $timeout () ->
    $rootScope.$state = $injector.get('$state');

  return {
    request: (request) ->
      request.headers = request.headers || {}
      if ($window.sessionStorage.token)
        request.headers.Authorization = "Token token=\"#{$window.sessionStorage.token}\""
      request
    responseError: (response) ->
      if response.status == 401
        flash.error = "You need to sign in to complete the previous action"
        $rootScope.$state.go('sign_in')
      $q.reject(response)
  }
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

app.run ["editableOptions", (editableOptions) ->
  editableOptions.theme = 'bs3'  # Bootstrap 3
]
