angular.module("coledger").controller("ProjectsMembersController", ['$scope', '$location', '$routeParams', 'Resources', 'flash'
  ($scope, $location, $routeParams, Resources, flash) ->
    $scope.refreshProject = ->
      Resources.Project.get $routeParams, (project) ->
        $scope.project = project
        $scope.currentUserMembership = project.memberships.filter((m) -> m.user.username == $scope.$parent.currentUser.username)[0]
        if $scope.currentUserMembership.role == "admin"
          project.memberships.filter((m) -> m.id != $scope.currentUserMembership.id).forEach (m) ->
            m.canEdit = true
            m.canDelete = true

    $scope.refreshProject()

    $scope.currentTab = "members"

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
        ], notitle: true, onChange: "updateMembershipRole(membership)" }
      ]

    $scope.membershipFormReadonly = [
        { key: 'role', type: 'radios-inline', titleMap: [
          { name: "Admin", value: "admin"}
          { name: "Editor", value: "editor"}
          { name: "Viewer", value: "viewer"}
        ], notitle: true, readonly: true }
      ]

    $scope.updateMembershipRole = (membership) ->
      Resources.Membership.update { project_id: $scope.project.id, id: membership.id }, { role: membership.role }, (response) ->
        membership = response
        flash.success = "The role of @#{membership.user.username} in this project has been changed to #{membership.role}"
      , (failure) ->
        flash.error = failure.data.error

    $scope.newMembership = { role: "viewer" }

    $scope.searchUsers = (username) ->
      Resources.User.search(null, { username }).$promise

    $scope.addMember = (form) ->
      Resources.Membership.save { project_id: $scope.project.id }, $scope.newMembership, (response) ->
        $scope.newMembership = { role: "viewer" }
        form.$setPristine()
        flash.success = "@#{response.user.username} has been added to this project"
        $scope.refreshProject()
      , (failure) ->
        flash.error = failure.data.errors?[0] || failure.data.error

    $scope.removeMember = (membership) ->
      Resources.Membership.remove { project_id: $scope.project.id, id: membership.id }, null, (response) ->
        $scope.refreshProject()
        flash.success = "@#{response.user.username} has been removed from this project"
      , (failure) ->
        flash.error = failure.data.errors?[0] || failure.data.error
])
