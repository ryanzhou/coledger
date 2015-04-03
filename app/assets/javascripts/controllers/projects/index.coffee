angular.module("coledger").controller("ProjectsIndexController", ['$scope', '$location', '$modal', 'Resources', 'flash'
  ($scope, $location, $modal, Resources, flash) ->
    $scope.refreshProjects = ->
      $scope.projects = Resources.Project.query()

    $scope.newProjectModal = ->
      $modal.open
        templateUrl: 'projects/new.html'
        controller: 'ProjectsNewController'
      .result.then (project) ->
        $scope.refreshProjects()

    $scope.refreshProjects()
])
