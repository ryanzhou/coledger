angular.module("coledger").factory "Resources", ["$resource", ($resource) ->
  Resources = {}

  Resources.Session = $resource('/sessions/:id')
  Resources.User = $resource('/users/:id', null,
    update: { method: 'PUT' }
  )
  Resources.Project = $resource('/projects/:id')
  Resources.Currency = $resource('/currencies/:id')

  Resources
]
