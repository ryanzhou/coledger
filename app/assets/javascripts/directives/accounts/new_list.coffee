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
      {
        key: 'color',
        type: 'radiobuttons',
        titleMap: ['red', 'green', 'blue', 'gray', 'orange'].map (color) ->
          { name: "<i class='fa fa-square #{color}-scheme'></i>", value: color }
        style: { selected: 'btn-primary' }
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
