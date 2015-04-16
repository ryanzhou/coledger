angular.module('coledger').factory('CurrentUser', ['Resources',
  (Resources) ->
    get: ->
      Resources.User.get id: 'current'
])
