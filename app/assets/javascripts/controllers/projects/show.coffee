angular.module("coledger").controller("ProjectsShowController", ['$scope', '$location', '$routeParams', 'Resources', 'flash'
  ($scope, $location, $routeParams, Resources, flash) ->
    $scope.project = {}
    $scope.refreshProject = ->
      $scope.project = Resources.Project.get($routeParams)
      $scope.project.$promise.then (data) ->
        $scope.currentUserMembership = $scope.project.memberships.filter((m) -> m.user.username == $scope.$parent.currentUser.username)[0]
        if $scope.currentUserMembership.role == "admin"
          $scope.project.memberships.filter((m) -> m.id != $scope.currentUserMembership.id).forEach (m) ->
            m.canEdit = true
            m.canDelete = true

    $scope.refreshProject()
])
