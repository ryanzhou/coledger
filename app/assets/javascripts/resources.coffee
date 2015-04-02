angular.module("coledger").factory "Resources", ["$resource", ($resource) ->
  Resources = {}

  Resources.Session = $resource('/sessions/:id')
  Resources.User = $resource('/users/:id', null,
    update: { method: 'PATCH' }
    search: { url: '/users/search', method: "POST", isArray: true }
  )
  Resources.Project = $resource('/projects/:id', null
    update: { method: 'PATCH' }
  )
  Resources.Membership = $resource('/projects/:project_id/memberships/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.Currency = $resource('/currencies/:id')
  Resources.Account = $resource('/projects/:project_id/accounts/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.List = $resource('/projects/:project_id/accounts/:account_id/lists/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.Transaction = $resource('/projects/:project_id/accounts/:account_id/transactions/:transaction_id', null,
    update: { method: 'PATCH' }
  )

  Resources
]
