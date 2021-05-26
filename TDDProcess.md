TDD Steps

If steps 2 to 4 takes more than 15mins make the problem you are trying to solve smaller.

1. Define the problem - read the question thoroughly. 
2. Plan a solution - maybe diagram a solution.
3. Write a test for the expected behavior. 
4. Write simplest solution to that expectation.
5. Refactor. 
6. Commit.

---

Examples: nb these steps are about behavior, not what we think the code will do / its internal functions.

"I expect the table to be four feet in diameter"
- test fails as i have no table
I cut a piece of wood that is four foot in diameter
- The test passes

"I expect the table to be three feet high"
- test fails as it is on the ground
I add one leg in the middle of the table
- The test passes

"I expect the table to hold 20lb of weight"
- test fails as there is only one leg
I add several legs 
- The test passes

---
