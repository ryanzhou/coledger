angular.module("coledger").controller("FaqController", ($scope) ->
	$scope.offset=100
	$scope.faqs = [
		{
			"id": "CoLedger",
			"barTitle": "Introduction",
			"title": "What is CoLedger?",
			"content": "
			CoLedger is a collaborative, simplified and customized accounting and budgeting software for teams with and without 
			accounting backgrounds. You could record and manage your incomes, expenses, assets and liabilities in an extreme convenient
			and powerful way.<br><br>
			<ul>
				<li><h4><b>Drag and drop between lists</b></h4>
					You could drag and drop any transaction between lists, and the amount total for each list is automatically 
					updated. Whether it's a received bill payment to paid, or a
					debt to a repayment, CoLedger makes the whole process for you incredibly easy.
				</li>
				<br>
				<li><h4><b>Collaborative features</b></h4>
					CoLedger is designed for small teams to work on accounting together. 
					All the transactions are stored in the cloud so there's no files to exchange and everyone is kept in sync.
				</li>
				<br>
				<li><h4><b>Visualize your data</b></h4>
					Real-time charts can be generated once you have added all your transactions to CoLedger. 
					It has never been easier to visualize accounting transactions.
				</li>
				<br>
				<li><h4><b>Security</b></h4>
					All communications between your browser and our server are encrypted with TLS. 
					Your data remains private even if you're using public internet.
				</li>
			</ul>"},
		{
			"id": "project",
			"barTitle": "Project",
			"title": "What is a <i>project</i> ?",
			"content": "
				A <i><b>project</b></i> can be anything: a company's financial record, a personal account book...
				<br><br><br>
				You could include almost everything around you related to money at CoLedger. Wow!",
		},
		{
			"id": "account",
			"barTitle": "Account",
			"title": "What is an <i>account</i> ?",
			"content": "
				In CoLedger, accounts constitute a project, and there are four types of them:
				<br><br><br><br>
				An <i><b>income account&nbsp;</b></i> manages transactions related to revenues and incomes.
				<br><br><br>
				An <i><b>expense account&nbsp;</b></i> takes charge of your spendings and expenditures
				<br><br><br>
				An <i><b>asset account&nbsp;</b></i> keeps track of your fixed and variable assets like properties and cash.
				<br><br><br>
				A <i><b>liability account&nbsp;</b></i> hold records of your loans or debts.
			"
		},
		{
			"id": "list",
			"barTitle": "List",
			"title": "What is a <i>list</i> ?",
			"content": "
				Many lists constitute an account. You can name them with anything and play them with any roles.
				<br><br><br><br>
				Examples of potential lists for different types of account:
				<br><br><br>
				<ul>
					<li><i><b>Monthly Salary&nbsp;</b></i> and <i><b>Bonus&nbsp;</b></i> for a personal income accounts</li>
					<br><br>
					<li><i><b>Meal Cost&nbsp;</b></i> and <i><b>Accommodation Fee&nbsp;</b></i> for a <i><b>\"Beijing trip\"&nbsp;</b></i> expense account</li>
					<br><br>
					<li><i><b>Saving&nbsp;</b></i> and <i><b>Cash&nbsp;</b></i> for a <i><b>\"Bank\"&nbsp;</b></i> asset accounts</li>
					<br><br>
					<li><i><b>Debt Owed&nbsp;</b></i> and <i><b>Repayment Returned&nbsp;</b></i> for a <i><b>\"Debt\"&nbsp;</b></i> liability accounts</li>
				</ul>
			"
		},
		{
			"id": "transaction",
			"barTitle": "Transaction",
			"title": "What is a <i>transaction&nbsp;</i> and how to creat it?",
			"content": "
				A <i><b>transaction&nbsp;</b></i> is the smallest unit of CoLedger. Transactions constitute a list.
				<br><br><br>
				To creat a <i><b>transaction&nbsp;</b></i>, simply typing in a name inside the <i><b>new transaction&nbsp;</b></i> bar 
				and a new form will appear for filling in the amount.
				<br><br><br>
				Click on existing transactions to see the detail. You could also add or edit the <i><b>name&nbsp;</b></i>, 
				<i><b>description&nbsp;</b></i>, <i><b>amount&nbsp;</b></i>, <i><b>due date&nbsp;</b></i>, 
				and <i><b>assignee&nbsp;</b></i>, or even make comments about the transaction.
			"
		},
		{
			"id": "member",
			"barTitle":"Member and permissions"
			"title":"How to invite members and set their permissions?"
			"content":"
				Within each <i><b>project</b></i> 's detail page, you can click on the <i><b>Members&nbsp;</b></i> tab to enter the member settings.
				<br><br><br>
				Inside the search bar, you can search for names across the whole CoLedger database 
				to add people to projects.
				<br><br><br>
				Each member can be granted to one of three permissions.
				<br><br><br>
				An <i><b>admin&nbsp;</b></i> has the permission to remove existing members, change other members' permission setting
				and has the access to read and edit.
				<br><br><br>
				An <i><b>editor&nbsp;</b></i> has the access to Create, Read, Update and Delete (CRUD) an account or a list, within a project. 
				An <i><b>editor&nbsp;</b></i> has no permission to member settings.
				<br><br><br>
				A <i><b>viewer&nbsp;</b></i> only has the read access to accounts and lists.
			"
		},
		{
			"id": "api",
			"barTitle":"CoLedger API"
			"title":"Is there an API available so that I could use this magnificent tool in developing my own project?"
			"content":"
				Hell Yes!!
				<br><br><br>
				Check out our <a href=\"http://docs.coledger.apiary.io/\" target=\"_blank\">API documentation</a>!
			"
		},
		{
			"id": "code",
			"barTitle":"Source Code and More"
			"title":"Is it possible to see the source code?"
			"content":"
				Sure! CoLedger is open-source.
				<br><br><br>
				check out the <a href=\"https://github.com/zhoutong/coledger/\" target=\"_blank\">GitHub repository</a> for source codes and 
				more technical descriptions including project proposal and plan.
			"
		}
	]
)
angular.module("coledger").filter("html", ['$sce',($sce)->
	(input)->
		$sce.trustAsHtml(input)
])
