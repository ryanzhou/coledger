angular.module("coledger").controller("ProjectsShowController", ['$scope', '$location', '$stateParams', 'Resources', 'flash'
  ($scope, $location, $stateParams, Resources, flash) ->
    $scope.project = {}
    $scope.refreshProject = ->
      $scope.projectPromise = Resources.Project.get($stateParams).$promise
      $scope.projectPromise.then (data) ->
        $scope.project = data
        cb = (currentUser) -> 
          $scope.currentUserMembership = $scope.project.memberships.filter((m) -> m.user.username == currentUser.username)[0]
          if $scope.currentUserMembership.role == "admin"
            $scope.project.memberships.filter((m) -> m.id != $scope.currentUserMembership.id).forEach (m) ->
              m.canEdit = true
              m.canDelete = true
        if ($scope.currentUser.then?())
          $scope.currentUser.then(cb)
        else
          cb($scope.currentUser)

    $scope.updateProject = ->
      Resources.Project.update { id: $scope.project.id }, $scope.project, (success) ->
        flash.success = "This project has been saved."

    $scope.refreshProject()
])
