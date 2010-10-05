
Feature: Basic CPU Play

	As a domino player
	I want the cpu to automatically play bones in turn
	So that the line will evolve between my turns
	
	Scenario: Cpu scores after lead-out
		Given the line has a single domino (the 6-6)
			And its the cpu's turn to play
			And the cpu has a 6-3, a 6-2, and a 5-5 in its hand
		When the cpu plays
		Then the domino played should have been the 6-3
			And the 3 of the 6-3 should become an open-end on the line
			And the 6 of the 6-6 should remain an open-end on the line
			And the cpu should score 15 points
			And the cpu's turn should be over
	
	Scenario: Cpu scores on two-ended line
	Scenario: Cpu scores on two-ended line with double
	Scenario: Cpu scores on third side of spinner
	Scenario: Cpu scores with lead-out
	Scenario: Cpu plays non-scoring domino
	Scenario: Cpu draws single bone and plays
	Scenario: Cpu draws multiple bones and plays
	Scenario: Cpu knocks
