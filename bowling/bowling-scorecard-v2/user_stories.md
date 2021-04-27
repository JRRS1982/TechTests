# User Stories

1. [x] As a bowler,
I want to record my score on every ball rolled,
so that I dont need to remember my score while I eat my chips.

2. [x] As a bowler,
I want to only face a maximum of 10 pins per roll,
so that I dont get an unfair advantage.

3. [x] As a bowler,
I want my game to have a maximum of ten frames,
so that I play within the rules of the game.

4. [x] As a bowler,
I want to get a bonus when scoring a spare or strike,
so that my score is calculated correctly.

5. [x] As a bowler,
I want to get the corrent amount of turns on frame 10,
so that i play by the rules.

## Acceptance Criteria

1. [x] Given I have started a game and not scored anything,
When I bowl a ball and hit one pin,
Then I want my score to show that i hit a pin.

2. [x] Given I have started a game and not scored anything,
When I bowl a ball and hit two pins,
Then I want my score to show that i hit two pins.

3. [x] Given I have started a game and not scored anything,
When I roll a ball,
Then I only want to have the option of hitting 0 to 10 pins.

4. [x] Given I have started on frame one,
When I roll a gutter ball two times,
Then I am moved onto frame 2.

5. [x] Given I am on frame one of a game,
When I roll a strike,
Then I am moved onto frame 2.

6. [x] Given I am on frame one of a game,
When I roll a spare in the frame,
Then I am moved onto frame 2.

7. [x] Given i am on frame one of a game,
When I roll gutter 18 times,
Then I am on frame 10 (not over yet).

8. [x] Given I am on frame one of a game,
When I roll a combination of 4 gutter rolls, a strike and a spare frame and a roll of 2,
Then it can tell me that I'm on frame 5.

9. [x] Given I have rolled 12 strikes,
When I call the score method,
Then it can acknowledge I my 300 score.

12. [x] Given I have rolled 11 strikes and a gutter midway,
When I call the score method,
Then it will acknowledge my 290 score.

13. [x] Given I have rolled a strike in frame10-1,
When I roll again,
then I get another roll with 10-2.

14. [x] Given I have rolled a strike in 10-2,
When I roll again,
Then I get another roll in 10-3.

15. [x] Given I have rolled a spare in 10-2,
When I roll again,
Then I get another roll in 10-3.

16. [x] Given I have not rolled a strike or spare in 10-2,
When I roll again,
Then I don't get another turn in 10-3.

17. [x] When I have a valid 10-3 roll,
When I roll,
Then the game ends.

18. [x] Given I have rolled a combination of rolls to end the game,
When I call score,
Then the games score is announced.

19. [x] Given I have scored a strike,
When I roll the next two balls,
Then those scores are included in the strike frame score.

20. [x] Given I have scored a strike,
When I roll the next two balls,
Then those scores are included in the strike frame score.

21. [x] Given I have scored a spare,
When I roll the next ball,
Then it is added the the spare frame score.

22. [x] Given I have rolled a spare,
When there isn't another roll available,
Then the spare frame score is returned without the bonus.

23. [x] Given I have rolled a strike,
When there isn't another roll available,
Then the strike frame score is returned without a bonus.

24. [x] Given I am playing a conventional game,
When I am not within the frame limits of 1-10,
Then i am given an error message.
