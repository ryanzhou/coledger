CoLedger
=====================

CoLedger is a collaborative, simplified and customized accounting and budgeting software for teams with and without accounting backgrounds.

This is the backend and frontend repository of CoLedger....

[CoLedger API documentation](http://docs.coledger.apiary.io)

## Demo

To check out and play around with the application you can go to the [App sign-in page](https://coledgerapp.herokuapp.com/users/sign_in) and login with username **testuser** and password **password**.

## Installation

Make sure you have MongoDB installed in your development machine.

Clone this project using Git, and install dependencies:

```
bundle install
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

## Security
* **Using MongodDB**: to prevent injection vulnerabilities.
* **Authentication**: We have opted to use token-based API authentication, instead of cookies for our back-end session management. This ensures that a session token must be explicitly set in the HTTP header for every request, rather than being automatically managed by the browser. Even though cookies can be made secure, using token-based authentication eliminates a whole class of risks related to the use of cookies, including CSRF. The session token persists in the browser's SessionStorage area.
* **CORS**: By default, CoLedger serves the front-end code and back-end API in the same domain name for simplicity of deployment. In the future, however, the front-end can be separated from the back-end. In that case, the CORS setting for the back-end service will be set to only allow XMLHttpRequest requests from the authorised front-end domain name.
* **By default**: CoLedger serves the front-end code and back-end API in the same domain name for simplicity of deployment. In the future, however, the front-end can be separated from the back-end. In that case, the CORS setting for the back-end service will be set to only allow XMLHttpRequest requests from the authorised front-end domain name.

