angular.module("coledger").controller("NewProjectController", ['$scope', '$modalInstance', 'Resources'
  ($scope, $modalInstance, Resources) ->
    Resources.Currency.query (data) ->
      $scope.currencies = data
      $scope.schema.properties.currency.enum = data.map((c) -> c.iso_code)
      $scope.form[2].titleMap = data.map((c) -> { value: c.iso_code, name: c.select_name })
      $scope.$broadcast('schemaFormRedraw')

    $scope.project = {}
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
        currency:
          title: 'Default Currency'
          type: 'string'
          required: true
          enum: []

    $scope.form = [
      'name'
      { key: 'description', type: 'textarea', placeholder: 'Describe your project in a few words...' }
      { key: 'currency' }
    ]

    $scope.createProject = (form) ->
      project = new Resources.Project($scope.project)
      project.$save (success) ->
        $scope.project = {}
        form.$setPristine()
        $modalInstance.close(project)
      , (failure) ->
        if failure.data.error_code == "VALIDATION_ERROR"
          $scope.errorMessages = failure.data.errors
        else
          $scope.errorMessages = [failure.data.error]

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
