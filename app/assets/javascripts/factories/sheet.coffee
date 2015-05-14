angular.module("coledger").factory 'Sheet', ->
  class Sheet
    constructor: (type) ->
      @sum = 0
      @accounts = []
      @selectedLists = []
      @type = type

    addAccount: (account) ->
      @accounts.push(account)
      angular.forEach(account.lists, (list) ->
        list.selected = true
      )
      account.sum = parseFloat(account.total.decimal, 10)
      @sum += account.sum
    toggleSelected: (account, list) -> 
      if (list.selected)
        account.sum += parseFloat(list.total.decimal, 10)
        @sum += parseFloat(list.total.decimal, 10)
      else
        account.sum -= parseFloat(list.total.decimal, 10)
        @sum -= parseFloat(list.total.decimal, 10)