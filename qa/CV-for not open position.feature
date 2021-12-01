Feature: Send CV for not open job position  
Background:
	Given: User went to the "Send us your CV" form at the down of the page 
@Happy_pass
1.1 Scenario: Send CV happy pass
		Given User entered Elena K in the name field
		And User entered len--k@yandex.ru in the e-mail field
		And User checked the checkbox
		And User attached CV in .pdf file 10 Mb
		When User press send button
		Then the CV should be received by recruiters
		And the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen.

1.2 Scenario: Send CV with message happy pass
		Given User entered name Elena K
		And User entered len--k@yandex.ru in the e-mail field
		And User entered 500 symbols in message field
		And User checked the checkbox
		And User attached CV in .docx file 10 Mb
		When User press send button
		Then the CV should be received by recruiters
		And the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen

@negative_tests
2.1 Scenario: Send CV with too large message 
		Given User entered Elena K in the name field
		And User entered len--k@yandex.ru in the e-mail field
		And User entered 501 symbols in message field
		And User checked the checkbox
		And User attached CV in .docx file 10 Mb
		When User press send button
		Then CV should be unsend 
		And the message "The maximum number of characters is 500" CV should be no the screen

2.2 Scenario: Empty forms, correct attached file
		Given User tipped no symbols in the name
		And User tipped no symbols in the e-mail
		And User attached CV in .pdf file
		And User checked the checkbox
		When User press send button
		Then CV should be unsend
		And Empty field should be highlighted in red
		And Messages "This field is required" should be near e-mail and name field

2.3 Scenario: No CV attached
		Given User entered name Elena K in the name field
		And User entered len--k@yandex.ru in the e-mail field
		And User checked the checkbox
		When User press send button
		Then CV should be unsend, attached CV button should be highlighted in red

2.4 Scenario: Unchecked checkbox 
		Given User entered Elena K in the name field
		And User entered len--k@yandex.ru in the e-mail field
		And User attached CV in .pdf file
		When User press send button
		Then CV should be unsent, checkbox should be highlighted in red

2.5 Scenario: Attached file in incorrect format
		Given User entered Elena K in the name field
		And User entered len--k@yandex.ru in the e-mail field
		And User tried to see file .jpg, .exe, .zip, .fb2, .txt extension 
		When User opened the folder with nessesary files on the device 
		Then User should not to see file with inapropriate extension 

@specific_tests_for_some_forms
3.1 Scenario Outline: correct format file testing
		Given User entered Elena K in the name field
		And User entered len--k@yandex.ru in the e-mail field
		And User checked the checkbox 
		And User attached CV in <Format>
		And User attached CV <Mb>
		Then the button send should be <Result> 

		Examples:
			  | Format | Mb |  Result |
			  | .pdf   | 10 | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | .doc   | 10 | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | .docx  | 10 | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | .rtf   | 10 | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | .doc   | 11 | message "Something went wrong, max size 10 mb"|

3.2 Scenario Outline: Name form testing
		Given User entered valid e-mail 
		And User entered <Name> in Name field
		And User attached CV .pdf 10 Mb
		And User checked the checkbox
		When User press send button
		Then the CV should be <Result> 

		Examples:
			  | Name                                                                    |  Result |
			  | Funny O'Lyry                                                            |  received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | Nickita Petrov                                                          |  received,the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | J J                                                                     | received,the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | J_J J                                                                   | unsent, Name highlighted, message "Invalid name format"    |
			  | len--k@yandex.ru                                                        |  unsent, Name highlighted, message "Invalid name format"   |
			  | Ûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûû ûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûû |  unsent, Name highlighted, message "Invalid name format"   |
			  | Ûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûûû ûûûûûûûûûûûûûûûûûûûûûûûûûûûûû   |  received,the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | J. Jungle                                                               |  received,the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | Petr 173                                                                |  unsent, Name highlighted, message "Invalid name format"|
			  | Piggle-pig Piggy                                                        |  received,the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | Lasse, Yanson                                                           |  received,the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | John Jonson&Jonson                                                      |  unsent, Name highlighted, message "Invalid name format" |

3.3 Scenario Outline: e-mail form testing

		Given User entered Elena K in the name field
		And User entered <e-mail> in e-mail form
		And User attached CV .pdf 10 Mb
		And User checked the checkbox
		When User press send button
		Then the CV should be <Result> 

		Examples:
			  | e-mail                                                                    |  Result |
			  | len--k@yandex.ru                                                          |  received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | len--k@yandex                                                             |  unsent,  e-mail highlighted, message "Invalid email format" |
			  | len--k@@yandex.ru                                                         |  unsent,  e-mail highlighted, message "Invalid email format" |
			  | Petrova-Ivanova-Fockina-Unated-Statete-Gorsheneva-Pichacu-UpI@yandex.ru   |  unsent, e-mail highlighted, message "The maximum number of characters is 70" |
			  | Petrova-Ivanova-Fockina-Unated-Statete-Gorsheneva-Pichacu-Up@yandex.ru    | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | len--k@yandex.ru.ru                                                       | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen  |
			  | len- -k@yandex.ru                                                         | unsent, e-mail highlighted, message "Invalid email format" |
			  | 123.yandex.ru                                                             | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | Jonson&Jonson@gmail.com                                                   | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  |Jonson'Jonson@gmail.com                                                    | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
			  | "Lasse"@mail.ru                                                           | received, the message "Thanks for being awesome! We have received your message and will come back to you as soon as we process it" should be on the screen |
