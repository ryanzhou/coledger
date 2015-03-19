angular.module("coledger").controller("ProjectsController", ['$scope', '$location', 'Resources', 'flash'
  ($scope, $location, Resources, flash) ->
    $scope.refreshProjects = ->
      $scope.projects = Resources.Project.query()

    Resources.Currency.query (data) ->
      console.log(data)
      $scope.currencies = data
      $scope.schema.properties.currency.enum = data.map((c) -> c.iso_code)
      $scope.form[1].titleMap = data.map((c) -> { value: c.iso_code, name: c.select_name })
      $scope.$broadcast('schemaFormRedraw')

    $scope.project = {}
    $scope.schema =
      type: 'object'
      title: 'Project'
      properties:
        name:
          title: 'Project Name'
          type: 'string'
          required: true
        currency:
          title: 'Default Currency'
          type: 'string'
          required: true
          enum: []

    $scope.form = [
      'name'
      { key: 'currency' }
      { type: 'submit', style: 'btn btn-primary', title: "Create Project" }
    ]

    $scope.createProject = (form) ->
      project = new Resources.Project($scope.project)
      project.$save (success) ->
        $scope.project = {}
        form.$setPrestine()
        $scope.refreshProjects()
      , (failure) ->
        flash.error = "There is an error with your input."

    $scope.refreshProjects()
])
