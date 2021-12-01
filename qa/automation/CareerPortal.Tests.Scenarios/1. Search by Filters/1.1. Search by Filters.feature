Feature: 1.1. Search by Filters

Background: 
    Given User is on https://career.quantori.com website
    And There are 10 available <positions> on the jobs page
    And There are 2 available <competence> on the jobs page
    And There are 2 available <technologies> on the jobs page
    |Position                                              ||competence       ||technologies|
    |Junior JavaScript Engineer                            ||Databases        ||SQL         |
    |Senior/Lead Manual QA Engineer (Life Science projects)||Business Analysis||.NET        |
    |Senior/Lead Manual QA Engineer (internal projects)    ||                 ||            |
    |Data Engineer (SQL)                                   ||                 ||            |
    |Snowflake Data Warehouse Certified Engineer           ||                 ||            |
    |Senior DWH / ETL Data Engineer                        ||                 ||            |
    |Data Engineer (Spark)                                 ||                 ||            |
    |Junior JavaScript Engineer                            ||                 ||            |
    |Senior QA Automation (Python) Engineer / SDET         ||                 ||            |
    |Senior Data Engineer                                  ||                 ||            |


Scenario: 1.1_01 Checking the function of the search button
    When User pushes "search" button
    Then User should be redirected to the new page "https://career.quantori.com/ru/positions"
    And  User should see default page "Quantori open job positions"

Scenario: 1.1_02 Returning to the general job list from the "Quantori Hot Open Job Positions list"
    Given User opened https://career.quantori.com/ru/positions/cloud-python-engineer website
    When At the bottom of the page user push "Back to open job positions" button
    Then User should be redirected to the new page https://career.quantori.com/ru/positions
    And  User should see default page "Quantori open job positions"

Scenario: 1.1_03 Checking the search by 1 competence filter
    When User chooses "Databases" competence with list box filter Competence
    And User pushes "search" button
    Then User should be redirected to the new page https://career.quantori.com/ru/positions
    And User should see only 2 vacancy "Data Engineer (SQL)" and "Snowflake Data Warehouse Certified Engineer"

Scenario Outline: 1.1_04 Checking the search by 1 technology filter
    When User chooses "SQL" technology with list box filter Technology
    And User pushes "search" button
    Then User should be redirected to the new page https://career.quantori.com/ru/positions
    And User should see only 8 <Position>
    
    Examples: 
                |Position                                              |
                |Junior JavaScript Engineer                            |
                |Senior/Lead Manual QA Engineer (Life Science projects)|
                |Senior/Lead Manual QA Engineer (internal projects)    |
                |Data Engineer (SQL)                                   |
                |Senior DWH / ETL Data Engineer                        |
                |Data Engineer (Spark)                                 |
                |Junior JavaScript Engineer                            |
                |Senior QA Automation (Python) Engineer / SDET         |
                |Senior Data Engineer                                  |


Scenario: 1.1_05 Checking the search by 1 competence filter and 1 technology filter
    When User chooses "Databases" competence with list box filter
    And User chooses "SQL" technology with list box filter
    Then User should be redirected to the new page https://career.quantori.com/ru/positions
    And User should see only 1 vacancy "Data Engineer (SQL)"

Scenario: 1.1_06 Checking the link with the selected components and technologies 
    When User opened competence list box filter 
    And User Chooses Databases competence 
    And User opened technologies list box filter 
    And User Chooses SQL technology
    And User Copies link with filters https://career.quantori.com/ru?competences=Databases&technologies=SQL
    And User Opens a new page in his browser 
    And pastes the copied link
    Then User should be redirected to the new page https://career.quantori.com/ru?competences=Databases&technologies=SQL
    And User should see only 1 vacancy "Data Engineer (SQL)"

Scenario: 1.1_07 Checking the form "Open job positions" without filters
    Given https://career.quantori.com/ru/positions website is opened 
    When User pushes "Open job positions" form
    Then User should stay on the same page
    And User should see default page with positions 

Scenario: 1.1_08 Checking the form "Open job positions" with filters
    Given https://career.quantori.com/ru/positions website is opened 
    When User chooses Databases competence with list box filter
    And User chooses SQL technology with list box filter
    And User pushes "Open job positions" form
    Then User should be redirected to the new page
    And  User should see default page "Quantori open job positions" without filters

Scenario: 1.1_09 Saving the cache when the page is refreshed on main Quantori page
    When User chooses Databases competence with list box filter
    And User chooses SQL technology with list box filter
    And User refreshes page
    Then User should see default page with filters

Scenario: 1.1_10 Saving the cache when the page is refreshed on "Quantori open job positions" page
    Given  https://career.quantori.com/ru/positions website is opened 
    When User chooses Databases competence with list box filter
    And User chooses SQL technology with list box filter
    And User refreshes page
    Then User should see https://career.quantori.com/ru/positions?competences=Databases&technologies=SQL page with filters

Scenario: 1.1_11  Checking the checkboxes when selecting a competency
    When User chooses Databases competence with list box filter
    Then User should see activated checkbox

Scenario: 1.1_12  Checking the checkboxes when selecting a technology
    When User chooses SQL technology with list box filter
    Then User should see activated checkbox

Scenario: 1.1_13  Checking the competency counter change when selecting the checkbox in the filter
    When User chooses Databases competence with list box filter
    Then User should see the competence counter changes from empty to 1

Scenario: 1.1_14  Checking the technology counter change when selecting the checkbox in the filter
    When User chooses SQL technology with list box filter
    Then User should see the technology counter change from empty to 1

Scenario: 1.1_15 Checking the selection of incompatible checkboxes
    Given https://career.quantori.com/ru/positions website is opened 
    When User chooses Business Analysis competence with list box filter
    And User chooses .NET technology with list box filter
    Then User should see empty vacancy page with text "If you don't see an open position that suits your skills stack and/or professional background but you are interested in working with us — please send your CV to career@quantori.com. We will try to find something special and interesting for you!"
 
Scenario: 1.1_16 Opening the "Quantori open job positions" page through the "More open job positions" form
    When User clicks on "More open job positions" below the list of "Quantori Hot Open Job Positions"
    Then User should be redirected to the new page "https://career.quantori.com/ru/positions"
    And  User should see default page "Quantori open job positions"

Scenario: 1.1_17 Checking the adaptation of the list of available jobs when you change the checkbox in the competence and technology filter
    Given User opened https://career.quantori.com/ru/positions website is opened 
    And flag is included in the "Data Engineering & Analytics" competence
    And flag is included in the "SQL" technology
    And User sees only 4 vacancies
    When User opens the list box of technologies and disables the "sql" checkbox
    Then User should see that the job list has been updated to display 8 jobs instead of 4