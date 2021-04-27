# Github-API-Request

This is the project file for a tech test that i was given by MVF, a digital marketing company that uses data to generate customer leads. A copy of the instructions can be found [here](Instructions.pdf).

## Description

The client wants to make a request to Github's API, with a specified users username, collect that users public information and interpret the available information to predict what the users favorite coding language is.

### [User Stories](#user_story) | [Tech](#tech) | [Reflection](#reflection) | [Contact](#contact)

#### Problem: Input / Outputs

Inputs: I have decided to make this a simple command line application, so it will take a string from the user (a users GitHub profile name) in IRB and that will be used to query the Github API which we expect will return a JSON file to the program for processing.

Outputs: Being a command line application it will print a string/statement to the terminal with a prediction to users favorite language, which will probably be attained by calculating the most commonly used language in a users portfolio.

### <a name="user_story">User Stories</a>

>AS A developer with friends,<br>
>I WANT TO analyze my friends Github profile then predict what their favorite coding language is,<br>
>SO THAT I can buy my friends a relevant coding present.<br>

#### Acceptance Criteria

Please find Acceptance Criteria [here](Acceptance_criteria.md).

### <a name="Tech">Tech Stack</a>

* Ruby version 2.5.0
* RSpec - for testing
* Capybara - for behavioral testing
* Simplecov - for test coverage
* Rubocop version 0.65.0 - for linting
* rest-client - for REST requests

#### API's Used

Documentation for the Github API which we interacted with can be found [here](https://developer.github.com/v3/)

### <a name="installation">Installation: how it works</a>

XXXXXXX

### <a name="screenshots">Screenshots / UML / Notes / Diagrams</a>

Should there be any images/notes, please find them in the images folder of the project. I will create a sequence diagram if i have time.

### <a name="reflection">Reflection and further development</a>

XXXX

### Credits / team members

This is a solo tech test exercise, any and all feedback on my code is welcome.
