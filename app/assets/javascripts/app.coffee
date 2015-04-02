app = angular.module("coledger", [
  "ui.router",
  "ngResource",
  "angular-flash.service",
  "angular-flash.flash-alert-directive",
  "ui.bootstrap",
  "schemaForm",
  "xeditable",
  "templates"
])

app.factory('authInterceptor', ['$rootScope', '$q', '$window', '$location', 'flash', ($rootScope, $q, $window, $location, flash) ->
  request: (request) ->
    request.headers = request.headers || {}
    if ($window.sessionStorage.token)
      request.headers.Authorization = "Token token=\"#{$window.sessionStorage.token}\""
    request
  # responseError: (response) ->
  #   if response.status == 401
  #     path = $location.path()
  #     if !(path == "/" || path.match(/^\/users\/(sign_in|sign_up)/))
        
  #   $q.reject(response)
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
