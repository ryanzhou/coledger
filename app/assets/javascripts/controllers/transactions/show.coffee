angular.module("coledger").controller("TransactionsShowController", ['$scope', '$modalInstance', 'flash', 'Resources', 'transaction', 'project', 'account'
  ($scope, $modalInstance, flash, Resources, transaction, project, account) ->
    $scope.transaction = angular.copy(transaction)
    $scope.memberships = project.memberships
    $scope.attachments = []
    $scope.attachment = {}
    $scope.isUploading = false

    $scope.parseTransactionDate = ->
      $scope.transaction.parsed_due_date = new Date($scope.transaction.due_date) if $scope.transaction.due_date

    $scope.updateTransaction = ->
      $scope.transaction.amount = $scope.transaction.amount.decimal
      $scope.transaction.due_date = $scope.transaction.parsed_due_date
      Resources.Transaction.update { project_id: project.id, account_id: account.id, id: transaction.id }, $scope.transaction, (success) ->
        flash.success = "Transaction has been saved."
        $scope.transaction.amount = success.amount
        $scope.transaction.assignee = success.assignee
      , (failure) ->
        flash.error = "Transaction cannot be saved due to an error."
    $scope.cancel = ->
      $modalInstance.dismiss('cancel')

    $scope.deleteTransaction = ->
      Resources.Transaction.delete { project_id: project.id, account_id: account.id, id: transaction.id }, (success) ->
        flash.success = "Transaction has been deleted."
        $modalInstance.dismiss('cancel')
      , (failure) ->
        flash.error = "Transaction does not exist, or you are not authorized to perform this action."

    $scope.removeAssignment = ->
      $scope.transaction.assignee_username = null
      $scope.updateTransaction()

    $scope.clearDueDate = ->
      $scope.transaction.parsed_due_date = null
      $scope.updateTransaction()

    $scope.refreshAttachments = ->
      Resources.Attachment.query $scope.transactionParams, (success) ->
        $scope.attachments = success

    $scope.uploadAttachment = ->
      $scope.isUploading = true
      Resources.Attachment.save $scope.transactionParams, $scope.attachment, (success) ->
        $scope.isUploading = false
        flash.success = "The attachment has been successfully uploaded."
        $scope.attachment = {}
        $scope.refreshAttachments()
      , (failure) ->
        $scope.isUploading = false
        flash.error = "There's an error with attachment upload or you're not authorized to perform this action."

    $scope.confirmDeleteAttachment = (attachment) ->
      attachment.confirmDelete = true

    $scope.cancelDeleteAttachment = (attachment) ->
      attachment.confirmDelete = false
      
    $scope.deleteAttachment = (attachment) ->
      params = angular.copy($scope.transactionParams)
      params.id = attachment.id
      Resources.Attachment.delete params, (success) ->
        flash.success = "The attachment has been successfully deleted."
        $scope.refreshAttachments()
      , (failure) ->
        flash.error = "You're not authorized to perform this action."

    $scope.transactionParams = { project_id: project.id, account_id: account.id, transaction_id: transaction.id }

    $scope.parseTransactionDate()
    $scope.refreshAttachments()

    $scope.$watch 'transaction.parsed_due_date', (newVal, oldVal) ->
      if newVal? && oldVal != newVal && $scope.transaction.parsed_due_date != new Date($scope.transaction.due_date)
        $scope.updateTransaction()
    , true
])
