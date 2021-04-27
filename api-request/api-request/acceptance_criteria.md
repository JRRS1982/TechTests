# Acceptance Criteria

All of these are assuming that the Github's API is working and i have a valid internet connection.

Scenario: profile name is correct.
```
GIVEN I have a valid user profile.
WHEN I have entered the profile name to the program and run it.
THEN I am returned a statement confirming the users most often used coding language.
```

Scenario: profile name is not correct.
```
GIVEN I do not have a valid user profile.
WHEN I have entered the profile name to the program and run it.
THEN I am am returned a statement advising that there is no code/repository.
```