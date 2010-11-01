
Feature: Start a new Match

	As a human domino player
	I want to begin a match of dominos
	So that I can pass the time away
	
	Scenario: I have the highest double of the first game of the match
		Given a match has been setup where I (the human player) has the highest double
		Then I should be welcomed to the game
			And I should be asked to begin play with the 6
	
	Scenario: One of my computer opponents has the highest double of the first game of the match
		Given the match has just begun
			And cpu1 has the highest double
		Then the announcer should tell me cpu1 has the highest double
			And cpu1 should automatically lead out with the highest double
			And each of the other cpu players should automatically play
			And the announcer should tell me it's my turn
			
