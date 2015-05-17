angular.module("coledger").controller("IndexController", ['$scope', '$window', '$timeout', 'Resources'
  ($scope, $window, $timeout, Resources) ->

    imagesLoaded '.flipster', ->
      $timeout ->
        $('.flipster').flipster(style: 'carousel')
      , 100

])
