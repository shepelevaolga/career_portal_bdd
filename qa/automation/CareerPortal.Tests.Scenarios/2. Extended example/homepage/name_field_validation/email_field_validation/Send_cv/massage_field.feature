Feature: 1.1.3 Attach CV and Send 

Background: 
	Given User  created 7 byte  "cv1.pdf" file
	And User created 10 Megabyte  "cv2.pdf" file
	And user created 7 byte  "cv3.docx" file
	And user created 10 megabyte "cv4.docx" file
	And user created 7 byte"cv5.rtf" file
	And User created 10 megabyte "cv6.rtf" file
	And User created 7 byte "cv7.doc" file
	And User created 10 megabyte "cv8.doc" file
	And User created 10.1 megabyte "cv9.doc" file
	And User fills in <name_field> "Timur Abdraimov"
	And User fills in <email_field> "timurabdraimov4@gmail.com"
	


Scenario: 1.1.9 Only required files are visible
		
	Given User clicks "<Attach_CV> Atach CV" button 
	When System opens file manager
	Then In "file manager" visible only "pdf, doc, docx, rtf" files

	@Negative
	Scenario: Sending cv without Attaching file
	When User clicks "<Send> Send " Button
	Then System displayed error "The file is required"
	


@Positive
@Equivalence_partition
Scenario: 1.1.10 Attaching "cv1.pdf" file
		
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv1.pdf" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that  "CV Sended"


@Positive
@Equivalence_partition
Scenario: 1.1.12 Attaching "cv2.pdf" file 
	
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv2.pdf" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that  "CV Sended"


@Positive
@Equivalence_partition
Scenario: 1.1.13 Attaching "cv3.docx" file
	
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv3.docx" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that  "CV Sended"


@Positive
@Equivalence_partition
Scenario: 1.1.14 Attaching "cv4.docx" file
	
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv4.docx" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that  "CV Sended"

@Positive
@Equivalence_partition
Scenario: 1.1.15 Attaching "cv5.rtf" file
	
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv5.rtf" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that  "CV Sended"

@Positive
@Equivalence_partition
Scenario: 1.1.16 Attaching "cv6.rtf" file
	
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv6.rtf" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that  "CV Sended"

@Positive
@Equivalence_partition
Scenario: 1.1.17 Attaching "cv7.doc" file
	
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv7.doc" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that  "CV Sended"

@Positive
@Equivalence_partition
Scenario: 1.1.18 Attaching "cv8.doc" file
	
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv1.doc" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that "CV Sended"


@Negative
@BounderyTest
Scenario: 1.1.19 Attaching "cv9.doc" file 
	
	When User clicks "<Attach_CV> Atach CV" button
	And In "File manager" User choose "cv9.doc" file 
	And The system displayed that  "File Atached"
	And User clicks "<Send> Button" 
	Then The system displayed that error "File"