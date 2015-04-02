angular.module("coledger").directive "accountsNewList", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'accounts/new_list.html'
  scope: true
  link: (scope, element, attrs) ->
    scope.list = {}
    scope.schema =
      type: 'object'
      title: 'List'
      properties:
        name:
          title: 'List Name'
          type: 'string'
          required: true
        color:
          title: 'Color Scheme'
          type: 'string'
          enum: ['red', 'green', 'blue', 'gray', 'orange']
          required: true

    scope.form = [
      'name',
      { key: 'color', type: 'radiobuttons', titleMap: [
          { name: "<i class='fa fa-square red-scheme'></i>", value: "red" }
          { name: "<i class='fa fa-square green-scheme'></i>", value: "green" }
          { name: "<i class='fa fa-square blue-scheme'></i>", value: "blue" }
          { name: "<i class='fa fa-square gray-scheme'></i>", value: "gray" }
          { name: "<i class='fa fa-square orange-scheme'></i>", value: "orange" }
        ], style: { selected: 'btn-primary' }
      }
      { type: 'submit', title: 'Create List', style: 'btn btn-primary' }
    ]

    scope.errorMessages = []

    scope.createList = (form) ->
      Resources.List.save { project_id: scope.project.id, account_id: scope.account.id }, scope.list, (success) ->
        flash.success = "List #{scope.list.name} has been successfully created!"
        scope.list = {}
        form.$setPristine()
        scope.errorMessages = []
        scope.refreshAccount()
      , (failure) ->
        scope.errorMessages = failure.data.errors || [failure.data.error]

]
