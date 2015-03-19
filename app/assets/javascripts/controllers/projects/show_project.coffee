angular.module("coledger").controller("ShowProjectController", ['$scope', '$location', '$routeParams', 'Resources'
  ($scope, $location, $routeParams, Resources) ->

    Resources.Project.get $routeParams, (project) ->
      $scope.project = project
      $scope.currentUserMembership = project.memberships.filter((m) -> m.user.username == "ryan")[0]
      if $scope.currentUserMembership.role == "admin"
        project.memberships.filter((m) -> m.id != $scope.currentUserMembership.id).forEach (m) ->
          m.canEdit = true

    $scope.membershipSchema =
      type: 'object'
      title: 'Membership'
      properties:
        role:
          title: 'Role'
          type: 'string'
          required: true
          enum: ['admin', 'editor', 'viewer']

    $scope.membershipForm = [
        { key: 'role', type: 'radios-inline', titleMap: [
          { name: "Admin", value: "admin"}
          { name: "Editor", value: "editor"}
          { name: "Viewer", value: "viewer"}
        ], condition: "membership.canEdit" }
        { key: 'role', type: 'radios-inline', titleMap: [
          { name: "Admin", value: "admin"}
          { name: "Editor", value: "editor"}
          { name: "Viewer", value: "viewer"}
        ], condition: "!membership.canEdit", readonly: true }
      ]
])
