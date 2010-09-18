

Feature: RadBones starts game

	As a domino player
	I want to begin a game of dominos
	So that I can pass the time away
	
	Scenario: receive welcome
		Given I'm not yet playing
		When I am welcomed by the game
		Then I should see "Hello! Welcome to Radbones."
		And I should see "Choose between 1 to 3 opponents:"
		
	Scenario Outline: enter number of opponents
		Given I've been asked "Choose between 1 to 3 opponents:"
		When I enter "<opponents>" 
		Then the response should be "<response>" 
		
	Scenarios: valid number of opponents 
		| opponents | response 				| 
		| 1 		| you are player 1 of 2 | 
		| 2			| you are player 1 of 3	| 
		| 3 		| you are player 1 of 4 | 
		 
	Scenarios: invalid number of opponents 
		| opponents | response 									| 
		| a 		| you must enter between 1 and 3 opponents	| 
		| 0 		| you must enter between 1 and 3 opponents	| 
		| 4 		| you must enter between 1 and 3 opponents	| 
		
	Scenario: I have the largest double-suited domino
		Given the game has begun
		When I have the largest double-suited domino
		Then I should see "You have the highest double-suited domino"

	Scenario: One of my opponents has the largest double-suited domino
		Given the game has begun
		When my opponent has the largest double-suited domino
		Then I should see "You opponent had the highest double-suited domino"
		