angular.module("coledger").controller("ProjectsShowController", ['$scope', '$location', '$stateParams', 'Resources', 'flash'
  ($scope, $location, $stateParams, Resources, flash) ->
    $scope.project = {}
    $scope.refreshProject = ->
      $scope.projectPromise = Resources.Project.get($stateParams).$promise
      $scope.projectPromise.then (data) ->
        $scope.project = data
        $scope.currentUserMembership = $scope.project.memberships.filter((m) -> m.user.username == $scope.$parent.currentUser.username)[0]
        if $scope.currentUserMembership.role == "admin"
          $scope.project.memberships.filter((m) -> m.id != $scope.currentUserMembership.id).forEach (m) ->
            m.canEdit = true
            m.canDelete = true

    $scope.refreshProject()
])
