angular.module("coledger").factory "Resources", ["$resource", ($resource) ->
  Resources = {}

  Resources.Session = $resource('/api/sessions/:id')
  Resources.User = $resource('/api/users/:id', null,
    update: { method: 'PATCH' }
    search: { url: '/api/users/search', method: "POST", isArray: true }
  )
  Resources.Project = $resource('/api/projects/:id', null
    update: { method: 'PATCH' }
  )
  Resources.Membership = $resource('/api/projects/:project_id/memberships/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.Currency = $resource('/api/currencies/:id')
  Resources.Account = $resource('/api/projects/:project_id/accounts/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.List = $resource('/api/projects/:project_id/accounts/:account_id/lists/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.Transaction = $resource('/api/projects/:project_id/accounts/:account_id/transactions/:id', null,
    update: { method: 'PATCH' }
  )
  Resources.Comment = $resource('/api/projects/:project_id/accounts/:account_id/transactions/:transaction_id/comments/:id')

  Resources.ResetPassword = $resource('/api/password_resets', null,
    edit: { url: '/api/password_resets/:reset_token/edit', method: 'GET'}
    update: {url: '/api/password_resets/:reset_token', method: 'PATCH'}
  )

  Resources
]
