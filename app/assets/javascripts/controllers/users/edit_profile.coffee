angular.module("coledger").controller("EditProfileController", ['$scope', '$location', '$window', 'Resources', 'flash',
  ($scope, $location, $window, Resources, flash) ->
    $scope.user = Resources.User.get(id: "current")
    $scope.errorMessages = []
    
    $scope.schema =
      type: 'object'
      title: 'User'
      properties:
        email:
          title: 'Email'
          type: 'string'
          required: true
        first_name:
          title: 'First Name'
          type: 'string'
          required: true
        last_name:
          title: 'Last Name'
          type: 'string'
          required: true

    $scope.form = [
      { key: 'email', type: 'email', validationMessage: "is not a valid email address" }
      { type: 'section', htmlClass: 'row', items: [
          { type: 'section', htmlClass: 'col-sm-6', items: ['first_name'] }
          { type: 'section', htmlClass: 'col-sm-6', items: ['last_name'] }
        ]
      }
      { type: 'submit', style: 'btn btn-primary', title: 'Update Profile'}
    ]

    $scope.submitForm = (form) ->
      $scope.$broadcast("schemaFormValidate")
      if (form.$valid)
        Resources.User.update(id: "current", $scope.user, (success) ->
          flash.success = "You have successfully updated your profile!"
          $scope.$parent.refreshUser()
        , (failure) ->
          if failure.data.error_code == "VALIDATION_ERROR"
            $scope.errorMessages = failure.data.errors
        )
])
