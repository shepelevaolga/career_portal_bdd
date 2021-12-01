Feature: 1.1.2. Name field  
Validate name field  in job position 

Background: 
	Given User in  https://qa-career.quantori.com/  website
	And User scrolls to the end of the page

@positive
Scenario Outline: 1.1.1 Validation with latin characters

	
	When user clicks on <Name_field> Text field
	And User fills <Name_field> with latin characters
		|Name_field				|
		|John					|
		|John Simons			|
		|John Simons Andrew		|
		|Isabella a Bella       |

	And user navigates away from blurs the <name_field>
	Then The system displayed that <name_field> field correct

@Positive
	Scenario Outline: 1.1.2. Validation with cyrillic characters
	Given User in job position page
	When User fills <Name_field> with kirilica characters
		|Name_field				|
		|Джон					|
		|Джон Симонс			|
		|Дон Симонс				|
		|ДЖон Симонс Эндрю		|
		|Изабелла а Белла       |
	
	And user navigates away from blurs the <name_field>
	Then the system displayes that <name_field> field correct
	
@Positive
@tc003
	Scenario Outline: 1.1.3 Validation with latin and cyrillic characters
	Given User in job position page
	And User fills <Name_field> Text field with latin characters
	|Name_field			|
	|Джон Simonss		|
	|Johн Сиmonс		|
	|Kриштиано Ronaldo  |

	And user navigates away from blurs the <name_field> and click
	Then the system displayes that <name_field> field correct

	
	@Negative
	Scenario Outline:1.1.4 Validation with numbers 
	
	Given User clicked on <name_field> text field
	When User writes <numbers> in <name_fild>
	|numbers      |
	|  123345     |
	And user navigates away from blurs the <name_field> and click
	Then the system displayed error message <name_field> Invalid name format

	@negative 
	Scenario Outline: 1.1.5 Validation with special characters
	Given User clicked on <name_field> text field
	When User writes <special characters> in <name_fild>
	|special_characters   |
	|  !@#$%^&*()_+       |
	And user navigates away from blurs the <name_field> and click
	Then the system displayed error message <name_field> Invalid name format




@Boundary_testing
@Positive
Scenario: 1.1.6. Validation with max and min symbols
 User writes from >=1 to <=70 characters to validate the text field "Name"
 Given User on job position page
 When User writes <Name> and <Surname> in <name_field> text fild 
  
 |Name                                |Surname                        |
 |D                                   |А                              |
 |Dflforkfmforlfldpekfdkdpdorkdldkvmfk|Fjgurpkfnvidjdofdjfifofiidjfofp|
 
        
 And  user navigates away from blurs the <name_field>
 Then the system displayed that <name_field> field correct

@Negative
Scenario Outline: 1.1.7 Validation with  0 and 71 characters 

Given User on job position page
When User writes <Name> and <Surname> in <name_field> text field 
|Name|Surname|
|  |   |
|Derklofmvnbjfkldcnjfldkfjdfldkflfpf| Kdldoriieurnvmdjfkdlvmcndkeodlsowerr|
 And the user navigates away from blurs the <name_field>
 Then the system displayed error message <name_field> "This field is required"

 



