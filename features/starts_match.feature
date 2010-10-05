
Feature: Start a new Match

	As a domino player
	I want to begin a match of dominos
	So that I can pass the time away
	
	Scenario: MatchController sets up new match
		Given I initiate a new match
		When I am welcomed
			And I am prompted to select my number of opponents
			And I choose 3 opponents
			And I am prompted to select the number of houses
			And I choose 5 houses
			And the match is started
		Then I should see "A'ight Playa. Let's do this thing."
			And an empty scorecard for 4 players should exist
	
	Scenario: MatchController starts first game
		Given I have started a match with 4 players
		Then a new game should start
			And there should be 4 players
			And each player should have 7 dominoes in their hand
			And the boneyard should be empty
			
	Scenario: I have highest pair
		Given I have started a match with 4 players
			And I have boxcars
		When I have the highest pair
		Then I should be prompted to play
		
	Scenario: A computer player has highest pair
		Given I have started a match with 4 players
		 	And the computer has the highest pair
		Then the computer should play that bone on the line