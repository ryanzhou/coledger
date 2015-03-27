angular.module("coledger").controller "AccountsNewController", ['$scope', '$modalInstance', 'Resources', 'project'
  ($scope, $modalInstance, Resources, project) ->
    $scope.account = {}
    $scope.schema =
      type: 'object'
      title: 'Account'
      properties:
        name:
          title: 'Account Name'
          type: 'string'
          required: true
        account_type:
          title: 'Account Type'
          type: 'string'
          required: true
          enum: ["income", "expense", "asset", "liability"]
          description: "Account type cannot be changed in the future."

    $scope.form = [
      'name'
      { key: 'account_type', type: 'radios', titleMap: [
        { name: "Income", value: "income" },
        { name: "Expense", value: "expense"},
        { name: "Asset", value: "asset"},
        { name: "Liability", value: "liability"}
      ] }
    ]

    $scope.submitForm = (form) ->
      Resources.Account.save { project_id: project.id }, $scope.account, (success) ->
        $scope.account = {}
        form.$setPristine()
        $modalInstance.close($scope.account)
      , (failure) ->
        $scope.errorMessages = failure.data.errors || [failure.data.error]

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
]
