app = angular.module("coledger", [
  "ui.router",
  "ngResource",
  "angular-flash.service",
  "angular-flash.flash-alert-directive",
  "ui.bootstrap",
  "schemaForm",
  "xeditable",
  "ngDraggable",
  "angularMoment",
  "pickadate",
  "chart.js",
  "duScroll",
  "naif.base64",
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
      if response.status == 401 && !$rootScope.$state.is("users.sign_up")
        flash.error = "You need to sign in to complete the previous action"
        $rootScope.$state.go('users.sign_in')
      else if response.status == 422
        for error in response.data.errors
          if error == "Current password is incorrect"
            $rootScope.$broadcast('schemaForm.error.current_password', 'incorrect', "The password is incorrect");
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

app.filter 'bytes', ->
	(bytes, precision) ->
		if (isNaN(parseFloat(bytes)) || !isFinite(bytes))
      '-'
		if (typeof precision == 'undefined')
      precision = 1
		units = ['bytes', 'kB', 'MB', 'GB', 'TB', 'PB']
		number = Math.floor(Math.log(bytes) / Math.log(1024))
		(bytes / Math.pow(1024, Math.floor(number))).toFixed(precision) +  ' ' + units[number]
