Feature: 3.1. List of open job positions

Background:
	Given user is on the https://career.quantori.com/ru/positions page
	And user opens the list of open job positions
	And user can use two filters of open job positions - by competence and technologies

Scenario: 3.1_01 User can open one of job positions
	When user clicks on one of the positions "QA Engineer (Life Science projects)"
	Then the page with description of this position should be opened https://career.quantori.com/ru/positions/qa-engineer-life-science-project

@Nonautomated
Scenario: 3.1_02 User can scroll the list of job positions
	When user uses the scroll on the side bar
	Then the page with open job positions should be scrolled down
	And the list of all open job positions should be presented

Scenario Outline: 3.1_03 User can use the filter search check by competence - one competence
	When user chooses one <competence> from the list of competencies
	Then the list of open job positions with selected competence should be presented

	Examples:
	| competence        |
	| Business Analysis |
	| QA                |
	| Mobile            |
	| DevOps            |
	| Management        |


Scenario Outline: 3.1_04 User can use the filter search check by technologies - one technology
	When user chooses one <technology> from the list of technologies
	Then the list of open job positions with selected technology should be presented
		
	Examples:
	| technology |
	| .Net       |
	| Android    |
	| iOS        |
	| Java       |
	| JavaScript |

Scenario: 3.1_05 User can use the filter search check by competence - more than one competence
	When user chooses more than one competence: "HPC, Mobile" from the list of competencies
	Then the list of open job positions with all selected competencies should be presented:"Senior Linux Engineer, Linux Engineer, Android Engineer, iOS Engineer"

Scenario: 3.1_06 User can use the filter search check by technologies - more than one technology
	When user chooses more than one technology : "Linux, C#" from the list of technologies
	Then the list of open job positions with all selected technologies should be presented:"Senior Linux Engineer, Linux Engineer, QA Automation (JavaScript) Engineer, Senior QA Automation (C#) Engineer"

Scenario: 3.1_07 User can use both filters by competence and technologies - one competence and one technology
	When user chooses one <competence> from the list of competencies
	And user chooses one <technology> from the list of technologies
	Then the list of open job positions with selected competence and technologe should be presented (if any exists)
	
	Examples:
	| competence        | technology |
	| Business Analysis | .Net       |
	| QA                | Android    |
	| Mobile            | iOS        |
	| DevOps            | Java       |
	| Management        | JavaScript |

Scenario Outline: 3.1_08 User can use both filters by competence and technologies - more than one
	When user chooses more than one <competence> from the list of competencies
	And user chooses more than one <technology> from the list of technologies
	Then the list of open job positions with all selected competencies and technologies should be presented (if any exists)

	Examples:
	| competence        | technology |
	| Business Analysis | .Net       |
	| QA                | Android    |
	| Mobile            | iOS        |
	| DevOps            | Java       |
	| Management        | JavaScript |
	| HPC               | Linux      |

Scenario: 3.1_09 User can update the page
	Given user chooses one or more competencies from the list of competencies
	And user chooses one or more technologies from the list of technologies
	When user updates the page
	Then the filters should be still enabled