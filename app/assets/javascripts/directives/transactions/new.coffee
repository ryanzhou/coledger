angular.module("coledger").directive "transactionsNew", ['Resources', 'flash', '$modal', (Resources, flash, $modal) ->
  restrict: 'E'
  templateUrl: 'transactions/new.html'
  scope: true
  link: (scope, element, attrs) ->
    scope.transaction = { list_id: scope.list.id }
    scope.schema =
      type: 'object'
      title: 'Transaction'
      properties:
        name:
          title: 'Name'
          type: 'string'
        amount:
          title: 'Amount'
          type: 'string'

    scope.form = [
      { key: 'name', title: null, placeholder: "New transaction...", feedback: false, autocomplete: false }
      { key: 'amount', title: null, placeholder: "0.00", feedback: false, autocomplete: false }
    ]

    scope.errorMessages = []

    scope.createTransaction = (form) ->
      Resources.Transaction.save { project_id: scope.project.id, account_id: scope.account.id }, scope.transaction, (success) ->
        flash.success = "Transaction #{scope.transaction.name} has been successfully created!"
        scope.transaction = {}
        form.$setPristine()
        scope.errorMessages = []
        scope.$parent.refreshAccount()
        scope.$parent.refreshTransactions()
      , (failure) ->
        scope.errorMessages = failure.data.errors || [failure.data.error]

]
