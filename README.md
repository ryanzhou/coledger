CoLedger
=====================

CoLedger is a collaborative, simplified and customized accounting and budgeting software for teams with and without accounting backgrounds.

This is the backend and frontend repository of CoLedger....

[CoLedger API documentation](http://docs.coledger.apiary.io)

## Installation

Make sure you have MongoDB installed in your development machine.

Clone this project using Git, and install dependencies:

```
Bundle Install 
```

Then run `rails server` to start the development web server.

## Data Management
Use the popular document-based database MongoDB to manage CoLedger's data.

## User Features

CoLedger offers a range of features which exceed the mininum accounting transaction requirements:

* **Flash messages**: All `POST` actions in the app will render flash messages after the redirections. This will allow users to receive immediate feedback on what they have done.
* **Data validation**: All forms have sensible validations. If something is invalid an error message will be displayed clearly next to the user input.
* **User, account, project CRUD**: Creating, reading, updating and deleting features are all available.
* **Instant Figure calculations**: All the agregated numbers on the top of account columns for each project would be updated instantly from user "Drag and Drop" actions.
* **Visualisation**: ?! Visualising project relevant or account specific figures in trends and graphs.
* **One to many poject management**: A user is allowed to maintain and manage more than one projects.  
* **Comments and attachments for accounting column**: For entries within each accounting column, comments are allowed as well as adding relevant attachments (e.g. purchase invoice) to it.
* **Customization of account scheme, background customization**: The account scheme and webpage backgound colors could be customised.

## Technical Feature
* **Front end browser**: JavaScript and AngularJS
* **Communication between fron end and application**: AJAX
* **Application Server**: Rails Back-end (RESTfull API)
* **Database Server**: MongoDB

## External Framework

## Security
