angular.module("coledger").controller("AccountsChartsController", ['$scope', '$stateParams', '$timeout', 'Resources',
  ($scope, $stateParams, $timeout, Resources) ->
    $scope.project = Resources.Project.get(id: $stateParams.project_id)
    $scope.account = Resources.Account.get(project_id: $stateParams.project_id, id: $stateParams.id)
    $scope.transactions = Resources.Transaction.query(project_id: $stateParams.project_id, account_id: $stateParams.id)

    $scope.selectDue = ->
      $timeout (-> $scope.showDue = true), 100
      $scope.dueSeries = []
      $scope.dueLabels = []
      $scope.dueData = []
      $scope.account.$promise.then ->
        $scope.transactions.$promise.then ->
          months = [0..11].map (o) ->
            date = new Date()
            date.setMonth(date.getMonth() + o)
            date
          list_ids = $scope.account.lists.map (l) -> l.id
          $scope.dueSeries = $scope.account.lists.map (l) -> l.name
          $scope.dueLabels = months.map (month) -> moment(month).format("MMM YYYY")
          $scope.dueData = list_ids.map (list_id) ->
            months.map (month) ->
              $scope.transactions.filter (t) -> t.due_date != null
              .filter (t) -> (new Date(t.due_date)).getMonth() == month.getMonth() && (new Date(t.due_date)).getYear() == month.getYear() && t.list_id == list_id
              .map (t) -> parseFloat(t.amount.decimal)
              .reduce ((a,b) -> a + b), 0

    $scope.deselectDue = ->
      $scope.showDue = false

    $scope.selectSummary = ->
      $timeout (-> $scope.showSummary = true), 100
      $scope.summaryData = []
      $scope.summaryLabels = []
      $scope.account.$promise.then ->
        $scope.summaryData = $scope.account.lists.map (l) -> l.total.decimal
        $scope.summaryLabels = $scope.account.lists.map (l) -> l.name

    $scope.deselectSummary = ->
      $scope.showSummary = false

    $scope.selectAssignee = ->
      $timeout (-> $scope.showAssignee = true), 100
      $scope.assigneeData = []
      $scope.assigneeLabels = []
      $scope.assigneeSeries = $scope.account.lists.map (l) -> l.name
      list_ids = $scope.account.lists.map (l) -> l.id
      $scope.account.$promise.then ->
        $scope.transactions.$promise.then ->
          $scope.assigneeLabels = $scope.project.memberships.map (m) -> m.user.username
          $scope.assigneeData = list_ids.map (list_id) ->
            $scope.assigneeLabels.map (username) ->
              $scope.transactions.filter (t) -> t.assignee && t.assignee.username == username && t.list_id == list_id
              .map (t) -> parseFloat(t.amount.decimal)
              .reduce ((a,b) -> a + b), 0

    $scope.deselectAssignee = ->
      $scope.showAssignee = false

])
