angular.module("coledger").controller("FaqController", ($scope) ->
	$scope.offset=80
	$scope.faqs = [
		{
			"id": "whatIsColedger",
			"title": "What Is Coledger?",
			"content": "
			CoLedger is a collaborative, simplified and customized accounting and budgeting software for teams with and without 
			accounting backgrounds.<br><br>
			<ul>
				<li><h4><b>Collaborative features</b></h4>
					It is designed for small teams to work on accounting together. 
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
			"id": "projects",
			"title": "Projects",
			"content": "This is nice, hey I can see you from here. How are you I'm fine. Node.js is required for asset compilation and JavaScript runtime. Microsoft's JScript is also supported, but it requires a patch to work in Windows 8.Installing Node.js is easier: https://nodejs.org/download/Do you really want to make a side navbar look just like the one from the Bootstrap Documentation pages? Then this is the article for you.In addition to really liking the bootstrap library, I have to say that I really enjoy the presentational style of their documentation page. I think it’s a great idea to show off the big picture of a document, while automatically expanding each section when appropriate. It’s especially helpful for long documents that require a lot of scrolling. Unfortunately, they don’t specifically outline how their documentation pages are put together. But since they’re just delivering HTML/CSS/JS, we can reverse engineer how they put it together. Here are the results of dissecting Bootstrap’s Doc’s side nav bar.The research revealed that the literal ups and downs of individual human height closely track variations in two factors: diet and disease. Particularly, where these two factors are at work during childhood. If children do not get enough food to eat or cannot absorb nutrients because of diarrhoeal illness, say, their chances of sprouting into their full potential adult height are greatly diminished.  \"Bottom line,\" says William Leonard, a professor of anthropology at Northwestern University in Illinois, \"the major drivers behind increased adult stature are improved nutrition,health,and in general a better quality of life.\"History is replete with examples of this height-health link. In the Western European late medieval period, after the Black Death had wiped out as much as 60% of the population, the survivors found they had access to plentiful food and uncrowded living conditions – both of which kept disease spread in check. People could thus grow relatively tall, with Englishmen just 4cm on average shorter than their fellow countrymen today."},
		{
			"id": "accounts",
			"title": "Accounts",
			"content": "This is nice, hey I can see you from here. How are you I'm fine. Node.js is required for asset compilation and JavaScript runtime. Microsoft's JScript is also supported, but it requires a patch to work in Windows 8.Installing Node.js is easier: https://nodejs.org/download/Do you really want to make a side navbar look just like the one from the Bootstrap Documentation pages? Then this is the article for you.In addition to really liking the bootstrap library, I have to say that I really enjoy the presentational style of their documentation page. I think it’s a great idea to show off the big picture of a document, while automatically expanding each section when appropriate. It’s especially helpful for long documents that require a lot of scrolling. Unfortunately, they don’t specifically outline how their documentation pages are put together. But since they’re just delivering HTML/CSS/JS, we can reverse engineer how they put it together. Here are the results of dissecting Bootstrap’s Doc’s side nav bar.The research revealed that the literal ups and downs of individual human height closely track variations in two factors: diet and disease. Particularly, where these two factors are at work during childhood. If children do not get enough food to eat or cannot absorb nutrients because of diarrhoeal illness, say, their chances of sprouting into their full potential adult height are greatly diminished.  \"Bottom line,\" says William Leonard, a professor of anthropology at Northwestern University in Illinois, \"the major drivers behind increased adult stature are improved nutrition,health,and in general a better quality of life.\"History is replete with examples of this height-health link. In the Western European late medieval period, after the Black Death had wiped out as much as 60% of the population, the survivors found they had access to plentiful food and uncrowded living conditions – both of which kept disease spread in check. People could thus grow relatively tall, with Englishmen just 4cm on average shorter than their fellow countrymen today."},
		{
			"id": "transcations",
			"title": "Transactions",
			"content": "This is nice, hey I can see you from here. How are you I'm fine. Node.js is required for asset compilation and JavaScript runtime. Microsoft's JScript is also supported, but it requires a patch to work in Windows 8.Installing Node.js is easier: https://nodejs.org/download/Do you really want to make a side navbar look just like the one from the Bootstrap Documentation pages? Then this is the article for you.In addition to really liking the bootstrap library, I have to say that I really enjoy the presentational style of their documentation page. I think it’s a great idea to show off the big picture of a document, while automatically expanding each section when appropriate. It’s especially helpful for long documents that require a lot of scrolling. Unfortunately, they don’t specifically outline how their documentation pages are put together. But since they’re just delivering HTML/CSS/JS, we can reverse engineer how they put it together. Here are the results of dissecting Bootstrap’s Doc’s side nav bar.The research revealed that the literal ups and downs of individual human height closely track variations in two factors: diet and disease. Particularly, where these two factors are at work during childhood. If children do not get enough food to eat or cannot absorb nutrients because of diarrhoeal illness, say, their chances of sprouting into their full potential adult height are greatly diminished.  \"Bottom line,\" says William Leonard, a professor of anthropology at Northwestern University in Illinois, \"the major drivers behind increased adult stature are improved nutrition,health,and in general a better quality of life.\"History is replete with examples of this height-health link. In the Western European late medieval period, after the Black Death had wiped out as much as 60% of the population, the survivors found they had access to plentiful food and uncrowded living conditions – both of which kept disease spread in check. People could thus grow relatively tall, with Englishmen just 4cm on average shorter than their fellow countrymen today."}
	]
)
angular.module("coledger").filter("html", ['$sce',($sce)->
	(input)->
		$sce.trustAsHtml(input)
])
