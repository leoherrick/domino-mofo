
Feature: Basic CPU Play

	As a domino player
	I want the cpu to automatically play bones in turn
	So that the board will evolve between my turns
	
	Scenario: Cpu plays scoring domino after lead-out has been played
		Given I'm playing in a match
			And the board has a single domino (the 6-6)
			And its the cpu's turn to play
			And the cpu has a 6-3, a 6-2, and a 5-5 in its hand
		When the cpu plays
		Then the domino played should have been the 6-3
			And the 3 of the 6-3 should become an open-end on the board
			And the 6 of the 6-6 should remain an open-end on the board
			And the cpu should score 15 points
			And the cpu's turn should be over
	
	Scenario: Cpu plays scoring domino on standard two-ended board
	Scenario: Cpu plays scoring domino on two-ended board when the domino is a double
	Scenario: Cpu plays scoring domino on the thin side of a spinner
	Scenario: Cpu plays scoring domino as the lead-out
	Scenario: Cpu plays domino with most pips if no scoring dominoes are available
	Scenario: Cpu draws from the boneyard if has no playable dominoes
	Scenario: Cpu passes if has no playable dominoes and the boneyard is empty
