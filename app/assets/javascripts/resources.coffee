angular.module("coledger").factory "Resources", ($resource) ->
  Resources = {}

  Resources.Session = $resource('/sessions/:id')
  Resources.User = $resource('/users/:id')
  Resources.Project = $resource('/projects/:id')
  Resources.Currency = $resource('/currencies/:id')
  
  Resources
