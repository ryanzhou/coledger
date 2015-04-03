'use strict';
angular.module('coledger').factory('Auth', ['$window', 
  ($window) -> 
    isLoggedIn: () ->
      $window.sessionStorage.token != "null" && $window.sessionStorage.token 
])