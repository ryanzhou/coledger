angular.module("coledger").controller("ProjectsController", ['$scope', '$location', '$modal', 'Resources', 'flash'
  ($scope, $location, $modal, Resources, flash) ->
    $scope.refreshProjects = ->
      $scope.projects = Resources.Project.query()

    $scope.newProjectModal = ->
      $modal.open
        templateUrl: 'projects/new_project.html'
        controller: 'NewProjectController'
      .result.then (project) ->
        $scope.refreshProjects()

    $scope.refreshProjects()
])
