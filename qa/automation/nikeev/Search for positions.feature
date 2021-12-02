Feature: User can search the job positions using the searching form on Quantori career portal

Scenario Outline: User can find the form for searching job positions on career portal
	Given user wanted to search open job positions in Quantori
	When user opens the <name of the page> page
	Then user finds the form for searching job positions
	And the form includes 'Competence' and 'Technologies' list boxes
	And the 'Search' button

	Examples: 
		| name of the page   |
		| Main               |
		| Open job positions |

Scenario Outline: User can choose only one 'Competence' position for searching
	Given user wanted to search open job positions using the form
	And opens the 'Competence' list box and chooses <name> position
	When user clicks on 'Search' button
	Then the Open job positions page opens in the same tab
	And the user sees job positions that relate to <name> competence

	Examples: 
		| name              |
		| Mobile            |
		| Databases         |
		| QA                |
		| DevOps            |
		| Business Analysis |

Scenario Outline: User can choose only 'Competence' criteria for searching
	Given user wanted to search open job positions using the form
	And opens the 'Competence' list box and chooses <num> positions
	When user clicks on 'Search' button
	Then the Open job positions page opens in the same tab
	And the user sees job positions that relate to <num> selected competences

	Examples: 
		| num |
		| 1   |
		| 7   |
		| all |

Scenario Outline: User can choose only one 'Technologies' position for searching
	Given user wanted to search open job positions using the form
	And opens the 'Technologies' list box and chooses <name> position
	When user clicks on 'Search' button
	Then the Open job positions page opens in the same tab
	And the user sees job positions that relate to <name> technology

	Examples: 
		| name      |
		| Android   |
		| Marketing |
		| Python    |
		| SQL       |
		| Atlassian |

Scenario Outline: User can choose only 'Technologies' criteria for searching
	Given user wanted to search open job positions using the form
	And opens the 'Technologies' list box and chooses <num> positions
	When user clicks on 'Search' button
	Then the Open job positions page opens in the same tab
	And the user sees job positions that relate to <num> selected technologies

	Examples: 
		| num |
		| 1   |
		| 11  |
		| all |

Scenario: User can leave both 'Competence' and 'Technologies' criteria empty for searching
	Given user wanted to search open job positions using the form
	And user doesn't choose any of positions in the 'Competence' and 'Technologies' list boxes
	When user clicks on 'Search' button
	Then the Open job positions page opens in the same tab
	And the user sees all open job positions

Scenario Outline: User can choose both 'Competence' and 'Technologies' criteria for searching
	Given user wanted to search open job positions using the form
	And opens the 'Competence' list box and chooses <comp_num> positions	
	And opens the 'Technologies' list box and chooses <tech_num> positions
	When user clicks on 'Search' button
	Then the Open job positions page opens in the same tab
	And the user sees job positions that relate both to <comp_num> selected competences and <tech_num> selected technologies

	Examples: 
		| comp_num | tech_num |
		| 1        | 1        |
		| 7        | 11       |
		| 11       | 7        |
		| all      | all      |