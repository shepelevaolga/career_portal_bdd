Feature: 1.1.4 Email text field validation

@Positive
Scenario Outline: Validation with valid email
	Given User clicked on email text field
	When User fills 'timurabdraimov4@gmail.com' in '<email>' text field
	And user navigates away from blurs the <email> text field
	Then The system displayed that <email> text field correct
	       
	
@negative
Scenario Outline: Validation with invalid email
	
	Given User clicked on email text field
	When User fills in '<email>' text field
	And user navigates away from blurs the '<email>' text field
	Then The system displayed error that '<email>' text field has "Invalid email format"
	Examples:
	|email                    |
	|timurabdraimov5gmail.com |
	|@Gmail.com               |
	|timurabdraimov           |
	|123134342343243          |
	|!@#$%^&*(@#$%^&*(        |
	|                         |
	|тимурабдраимов           |
	
		


        



