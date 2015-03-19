angular.module("coledger").controller("ProjectsController", ['$scope', '$location', 'Resources', 'flash'
  ($scope, $location, Resources, flash) ->
    $scope.refreshProjects = ->
      $scope.projects = Resources.Project.query()

    $scope.currencies = Resources.Currency.query()

    $scope.createProject = (form) ->
      project = new Resources.Project(form)
      project.$save (success) ->
        $scope.refreshProjects()
      , (failure) ->
        flash.error = "There is an error with your input."

    $scope.refreshProjects()

])
