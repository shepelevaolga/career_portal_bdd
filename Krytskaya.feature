Feature: 1.1. Contacts

Background:
    Given user clicked on Notifications "Contacts" 

Scenario Outline: 1.1.1 All external links should be active and right
    Given user scrolled Contacts to bottom app bars
    When user clicked on "<Button>" icon
    Then open a new window in browser 
    And open an external link <Go to>:
        | Button   | Go to                                     |
        | site     | https://www.quantori.com/                 |
        | mail to  | career@quantori.com                       |
        | hh       | https://hh.ru/employer/3343960            |
        | facebook | https://www.facebook.com/quantoricom/     |
        | instagram| https://instagram.com/quantori_community  |
        | vk       | https://vk.com/quantori                   |
        | linkedin | https://www.linkedin.com/company/quantori |

Scenario Outline: 1.1.2 All internal notifications links should be active and right
    Given user scrolled Contacts to the top app bars
    When user clicked on "<Notification>" icon
    Then open an internal link <Go to>:
        | Notification      | Go to                                     |
        | About             | https://career.quantori.com/ru/about      |
        | Open job positions| https://career.quantori.com/ru/positions  |
        | Contact           | https://career.quantori.com/ru/contact    |

Scenario Outline: 1.1.3 An internal link to the title page should be active and right
    Given user scrolled Contacts on to the top app bars
    When user clicked on "<Icon>" 
    Then open an internal link <Go to>:
        | Icon              | Go to                                     |
        | QUANTORI          | https://career.quantori.com/ru            |

Scenario Outline: 1.1.4 A message should be send to the mail
    Given user scrolled Contacts
    When user clicked on e-mail adress 
    Then open a mail  program

Scenario Outline: 1.1.5 An additional information should be delivery
    Given user scrolled Contacts to the bottom app bars
    When user clicked on "<link>" adress 
    Then open a corresponding additioinal <information>
        | link                | information                                                         |
        | Data Privacy Policy | https://career.quantori.com/static/Quantori_Web_Privacy_Policy.pdf  |
        | Cookies Settings    | https://career.quantori.com/static/Quantori_Web_Privacy_Policy.pdf  |

Scenario Outline: 1.1.6 A phone number should be available
    Given user scrolled Contacts to the phone number of the offices
    When user clicked on number
    Then start calling

