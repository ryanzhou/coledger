angular.module("coledger").factory "Resources", ["$resource", ($resource) ->
  Resources = {}

  Resources.Session = $resource('/sessions/:id')
  Resources.User = $resource('/users/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.Project = $resource('/projects/:id')
  Resources.Membership = $resource('/projects/:project_id/memberships/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.Currency = $resource('/currencies/:id')

  Resources
]
