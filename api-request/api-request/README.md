# API-Request (Favourite X)

This is the project file for a tech test that I was given by MVF, a digital marketing company that uses data to generate customer leads. A copy of the instructions can be found [here](Instructions.pdf).

## Description

The client wants to make a request to Github's API, with a specified username, get that users (public) data and interpret the available information to predict what the users favorite coding language is. The product can be a web or command line application in any language.

### [User Stories](#user_story) | [Tech](#tech) | [Reflection](#reflection) | [Contact](#contact)

#### Problem: Inputs / Outputs

Inputs: As it is a quicker route to MVP I have decided to make this a command line application, so it will take a string from the user (a users GitHub profile name) on the command line. We expect Github's API to be queried and return a JSON file which we will then need to process.

Outputs: Being a command line application it will print a string / statement to the terminal with a prediction of the users favorite language. The prediction will be attained by calculating the most commonly used language across the users public portfolios.

### <a name="user_story">User Stories</a>

At an epic level the user story is;

>AS A developer with friends,<br> I WANT TO predict what my friends favorite coding language is by querying Github, <br> SO THAT I can buy my friend a relevant coding present.

#### Acceptance Criteria

Please find Acceptance Criteria [here](acceptance_criteria.md).

### <a name="Tech">Tech Stack</a>

* Ruby version 2.5.0
* RSpec - for testing
* Simplecov - for test coverage
* Rubocop version 0.65.0 - for style linting
* Webmock gem - mocking requests
* Rest-client gem - making http requests
* Json gem - so we can parse the JSON file from the API
* Pry gem - debugging helper

#### API's Used

Documentation for the Github API which we interacted with can be found [here](https://developer.github.com/v3/)

The Github Search API limits requests to 30 searches a minute. So if there are over 30 requests though tests or other means to the API I may block my connection, which would be a problem. Having discovered this and being aware that a poor internet connection or multiple external API requests may slow my tests and make it less reliable I decided to stub the request / response while testing (after establishing a genuine connection in the first place).

### <a name="installation">Installation: how it works</a>

Clone the repository to your local machine.
```
$ git clone git@github.com:JRRS1982/API-Request.git
```
Navigate into the program
```
$ cd API-Request
```
Install the gems from the gemfile
```
$ bundle install
```
Load irb and the code
```
$ irb
$ require './lib/favourite.rb'
```
Name and create your instance
```
$ favourite = Favourite.new
```

> Decisions now need to be made:

The 'request' method takes a data requester and a parameter that the data requester might require and uses them to return a file to the program. In this instance we have a module that requests details of a users repos from Github and the name of the user that we are requesting information about.

As long as the inserted data requester responds to a 'collect' method (and returns a json) it is replaceable. This opens the program up for extension to other data requesters and as we are passing a parameter those data requesters can be tailored.

Simply for ease of use I have passed a default data requester of my github_api_repo_requester module.

```
$ favourite.request(data_requester_parameter: 'JRRS1982', data_requester: data_requester = GitHubApiRepoRequester.new)
```
Now the data has been saved I need to pick an attribute I wish to check, in this case we are looking for 'language'. This parameter is replaceable with any other key in the dataset. The print_out method will print the result of the search to the command line.
```
$ favourite.print_out('language')
```

To prevent unnecessary requests to the Github API, I have used json files to stub the tests. A real repo can be used in production, but I have used WebMock to disable connections while testing.

### <a name="screenshots">Screenshots / UML / Notes / Diagrams</a>

Please find some class diagrams in the images folder of the project.

### <a name="reflection">Reflection and further development</a>

I test drove the project, starting with a simple UML class diagram followed by a feature test, then writing the code to pass that test and refactoring in the standard TDD way.

I tried to have public method, behavioral tests in place to check that my expectations were correct, which really helped later refactoring. I did well not to tie myself into spaghetti code with unit tests checking state or private methods that were later refactored out into modules or other classes. I changed names of classes and methods several times, which I believe is fine to do and a style of refactoring.

Classes and modules were not very transparent at first, but they started appearing as single responsibilities were applied and I am now happy with their state. I like the 'create array from hash' module and 'most common in array' module which are tidy and reusable snippets of code. When 'github_api_repo_requester' became a single responsibility class, it opened my eyes to the program having more potential. The option of extending the program with other API requests and parameters became apparent, by changing it's structure from a program that just found a 'favourite_language' to a program that found a changeable 'favourite' from a flexible data source.

Further development could be carried out on the 'github_api_requester' module, I feel that the github element could be removed and a superclass could be added. Perhaps 'request_from_api', with github_api_requester providing the url and attributes required to make this specific request - however that may be over engineering the problem.

### Credits / team members

This is a solo tech test exercise, any and all feedback on my code or back to me in person is greatly appreciated.
