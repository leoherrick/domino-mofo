
Feature: Start a Game

	As a domino player
	I want to begin a game of dominos
	So that I can pass the time away
	
	Scenario: Start a new game
		Given I have just started Domino Mofo
		When I am welcomed by the game
			And I am asked how many players I want to play
			And I choose 2 players
			And I am asked how many houses I want to play to
			And I choose 2 houses
			And when the game starts
		Then I should see "A'ight Playa. Let's do this thing."
			And I should have 7 dominos in my hand
			And and the boneyard should have 14 dominos 
			And a scorecard should have been drawn with 2 empty columns 
	
	
#	Scenario Outline: Start a new game
#		Given I have just started Domino Mofo
#		When I am welcomed by the game
#			And I am asked how many players I want to play
#			And I choose <players> players
#			And I am asked how many houses I want to play to
#			And I choose <houses> houses
#			And when the game starts
#		Then I should see "A'ight Playa. Let's do this thing."
#			And I should have 7 dominos in my hand
#			And and the boneyard should have <bones in boneyard> dominos 
#			And a scorecard should have been drawn with <players> empty columns 
#
#	Scenarios: Valid players and houses
#		| players 	| houses 	| bones in boneyard |
#		| 2			| 2			| 14				|
#		| 2			| 3			| 14				|
#		| 3			| 5			| 7					|
#		| 4			| 4			| 0 				|