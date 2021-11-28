Feature: Filters for vacancies

Background:
Given User is on https://career.quantori.com/ru/positions
And vacancies available with Security and Compliance Competence
And vanacies available with Linux Techology

Scenario: Drop-down of Competence and Technologies
When User clicks the fields Competence or Technologies
Then User sees drop-down menu with available Competencies or Technologies

Scenario: Counter for filters
When User chooses one or more positions in drop-down menu or unchecks the box
Then Counter in brackets changes its state (increases or decreases)

Scenario: Display of vacancies by the selected Competence
When User chooses Security and Compliance competence
Then User sees list of vacancies ( Information Security Specialist) with parameter Remote/Office

Scenario: Display of vacancies by the selected Technology
When User choose Linux Technology
Then User sees list of vacancies (Senior Linux Engineer, Linux Engineer) with parameters Remote/Office

Scenario: If the vacancy is not found
When User chooses Security and Compliance Competence and Linux Technology
Then Use sees text "If you don't see an open position that suits your skills stack and/or professional background but you are interested in working with us — please send your CV to career@quantori.com. We will try to find something special and interesting for you!"


