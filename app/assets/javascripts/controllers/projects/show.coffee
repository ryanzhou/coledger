angular.module("coledger").controller("ProjectsShowController", ['$scope', '$location', '$routeParams', 'Resources', 'flash'
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
])
