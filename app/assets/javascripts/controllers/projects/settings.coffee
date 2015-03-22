angular.module("coledger").controller("ProjectsSettingsController", ['$scope', '$location', '$routeParams', 'Resources', 'flash'
  ($scope, $location, $routeParams, Resources, flash) ->

    $scope.project = Resources.Project.get $routeParams
    $scope.currentTab = "settings"

    $scope.errorMessages = []

    $scope.schema =
      type: 'object'
      title: 'Project'
      properties:
        name:
          title: 'Project Name'
          type: 'string'
          required: true
        description:
          title: 'Description'
          type: 'string'

    $scope.form = [
      'name'
      { key: 'description', type: 'textarea', placeholder: 'Describe your project in a few words...' }
      { type: 'submit', title: 'Update Project', style: 'btn btn-primary'}
    ]

    $scope.updateProject = (form) ->
      Resources.Project.update { id: $scope.project.id }, $scope.project, (response) ->
        flash.success = "Project has been saved."
      , (failure) ->
        if failure.data.error_code == "VALIDATION_ERROR"
          $scope.errorMessages = failure.data.errors
        else
          flash.alert = failure.data.error
 ])
