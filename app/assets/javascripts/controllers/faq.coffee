angular.module("coledger").controller("FaqController", ($scope) ->
	$scope.offset=100
	$scope.faqs = [
		{
			"id": "CoLedger",
			"barTitle": "Introduction",
			"title": "What is CoLedger?",
			"content": "
			<p>CoLedger is a collaborative, simplified and customized accounting and budgeting software for teams with and without
			accounting backgrounds. You could record and manage your incomes, expenses, assets and liabilities in an extreme convenient
			and powerful way.</p>
			<h4>Drag and drop between lists</h4>
			<p>You could drag and drop any transaction between lists, and the amount total for each list is automatically
					updated. Whether it's a received bill payment to paid, or a
					debt to a repayment, CoLedger makes the whole process for you incredibly easy.</p>
			<h4>Collaborative features</h4>
			<p>CoLedger is designed for small teams to work on accounting together.
					All the transactions are stored in the cloud so there's no files to exchange and everyone is kept in sync.
			</p>
			<h4>Visualize your data</h4>
			<p>Real-time charts can be generated once you have added all your transactions to CoLedger.
					It has never been easier to visualize accounting transactions.
				</p>
			<h4>Security</h4>
			<p>All communications between your browser and our server are encrypted with TLS. Your data remains private even if you're using public internet.</p>
			"
		},
		{
			"id": "project",
			"barTitle": "Project",
			"title": "What is a project?",
			"content": "
				<p>A <span class=\"tech\">project</span> can be anything: a company, a team or even a holiday plan.</p>
				<p>You can add almost everything money-related to CoLedger.</p>"
		},
		{
			"id": "account",
			"barTitle": "Account",
			"title": "What is an account?",
			"content": "
				<p>In CoLedger, accounts constitute a project, and there are four types of them:</p>
				<ul>
				<li>An <span class=\"tech\">income account</span> manages transactions related to revenues and incomes.</li>
				<li>An <span class=\"tech\">expense account</span> takes charge of your spendings and expenditures.</li>
				<li>An <span class=\"tech\">asset account</span> keeps track of your fixed and variable assets like properties and cash.</li>
				<li>A <span class=\"tech\">liability account</span> hold records of your loans or debts.</li>
				</ul>
			"
		},
		{
			"id": "list",
			"barTitle": "List",
			"title": "What is a list?",
			"content": "
				<p>Many lists constitute an account. You can name them with anything and play them with any roles.</p>
				<p>Examples of potential lists for different types of account:</p>
				<ul>
					<li><span class=\"tech\">Monthly Salary</span> and <span class=\"tech\">Bonus</span> for a personal income account</li>
					<li><span class=\"tech\">Meal Cost</span> and <span class=\"tech\">Accommodation Fee</span> for a <span class=\"tech\">\"Beijing trip\"</span> expense account</li>
					<li><span class=\"tech\">Saving</span> and <span class=\"tech\">Cash</span> for a <span class=\"tech\">\"Bank\"</span> asset accounts</li>
					<li><span class=\"tech\">Debt Owed</span> and <span class=\"tech\">Repayment Returned</span> for a <span class=\"tech\">\"Debt\"</span> liability accounts</li>
				</ul>
			"
		},
		{
			"id": "transaction",
			"barTitle": "Transaction",
			"title": "What is a transaction and how to creat it?",
			"content": "
				<p>A <span class=\"tech\">transaction</span> is the smallest unit of CoLedger. Transactions constitute a list.</p>
				<p>To create a <span class=\"tech\">transaction</span>, simply typing in a name inside the <span class=\"tech\">new transaction</span> bar
				and a new form will appear for filling in the amount.</p>
				<p>Click on existing transactions to see the detail. You could also add or edit the <span class=\"tech\">name</span>,
				<span class=\"tech\">description</span>, <span class=\"tech\">amount</span>, <span class=\"tech\">due date</span>,
				and <span class=\"tech\">assignee</span>, or even make comments about the transaction.</p>
			"
		},
		{
			"id": "member",
			"barTitle":"Member and permissions"
			"title":"How to invite members and set their permissions?"
			"content":"
				<p>Within each <span class=\"tech\">project</span>'s detail page, you can click on the <span class=\"tech\">Members</span> tab to enter the member settings.</p>
				<p>Inside the search bar, you can search for names across the whole CoLedger database
				to add people to projects.</p>
				<p>Each member can be granted to one of three permissions:</p>
				<ul>
				<li>An <span class=\"tech\">admin</span> has the permission to remove existing members, change other members' permission setting
				and has the access to read and edit.</li>
				<li>An <span class=\"tech\">editor</span> has the access to Create, Read, Update and Delete (CRUD) an account or a list, within a project.
				An <span class=\"tech\">editor</span> has no permission to member settings.</li>
				<li>A <span class=\"tech\">viewer</span> only has the read access to accounts and lists.</li>
				</ul>
			"
		},
		{
			"id": "api",
			"barTitle":"CoLedger API"
			"title":"Is there an API available so that I can develop an app on top of CoLedger?"
			"content":"
				<p>Yes! Check out our <a href=\"http://docs.coledger.apiary.io/\" target=\"_blank\">API documentation</a>!
			"
		},
		{
			"id": "code",
			"barTitle":"Source Code and More"
			"title":"Is it possible to see the source code?"
			"content":"
				Yes! CoLedger is a MIT-licensed open source project. The source is available in the <a href=\"https://github.com/zhoutong/coledger/\" target=\"_blank\">official GitHub repository</a>.
			"
		}
	]
)
angular.module("coledger").filter("html", ['$sce',($sce)->
	(input)->
		$sce.trustAsHtml(input)
])
