Feature: 3.2. List of open job positions

Background:
	Given user is on the https://career.quantori.com/ru/positions page
	And there are two filters of open job positions - by competence and technologies

Scenario Outline: 1.2_01 User can use the filter by competence - one competence
	When user chooses one <competence> from the list of competencies
	Then the list of open job positions with selected competence is presented

	Examples:
	| competence        |
	| Business Analysis |
	| QA                |
	| Mobile            |
	| DevOps            |
	| Management        |


Scenario Outline: 1.2_02 User can use the filter by technologies - one technology
	When user chooses one <technology> from the list of technologies
	Then the list of open job positions with selected technology is presented
		
	Examples:
	| technology |
	| .Net       |
	| Android    |
	| iOS        |
	| Java       |
	| JavaScript |

Scenario: 1.2_03 User can use the filter by competence - more than one competence
	When user chooses more than one competence: "HPC, Mobile" from the list of competencies
	Then the list of open job positions with all selected competencies is presented:"Senior Linux Engineer, Linux Engineer, Android Engineer, iOS Engineer"

Scenario: 1.2_04 User can use the filter by technologies - more than one technology
	When user chooses more than one technology : "Linux, C#" from the list of technologies
	Then the list of open job positions with all selected technologies is presented:"Senior Linux Engineer, Linux Engineer, QA Automation (JavaScript) Engineer, Senior QA Automation (C#) Engineer"

Scenario: 1.2_05 User can use both filters by competence and technologies - one competence and one technology
	When user chooses one <competence> from the list of competencies
	And user chooses one <technology> from the list of technologies
	Then the list of open job positions with selected competence and technologe is presented (if any exists)
	
	Examples:
	| competence        | technology |
	| Business Analysis | .Net       |
	| QA                | Android    |
	| Mobile            | iOS        |
	| DevOps            | Java       |
	| Management        | JavaScript |

Scenario Outline: 1.2_06 User can use both filters by competence and technologies - more than one
	When user chooses more than one <competence> from the list of competencies
	And user chooses more than one <technology> from the list of technologies
	Then the list of open job positions with all selected competencies and technologies is presented (if any exists)

	Examples:
	| competence        | technology |
	| Business Analysis | .Net       |
	| QA                | Android    |
	| Mobile            | iOS        |
	| DevOps            | Java       |
	| Management        | JavaScript |
	| HPC               | Linux      |

Scenario: 1.2_07 User can update the page
	When user chooses one or more competencies from the list of competencies
	And user chooses one or more technologies from the list of technologies
	And user updates the page
	Then the filters are still enabled