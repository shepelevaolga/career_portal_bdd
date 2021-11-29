Feature: Send CV

    Background:
        Given I am on the page https://career.quantori.com/positions/senior-qa-automation-javascript-engineer

    @Positive
    Scenario Outline: Successful CV submissions
        Given I fill the Name field with <Name>
        And I fill the Email field with <Email>
        And I fill the Message field with some <Data>
        And I attach <CV_file> less than 10 Mb
        And I mark checkbox
        When I click the Send button
        Then I see the message about the successful CV submission
        And The input fields are empty
        Examples:
            | Name                                                                   | Email                                                                  | CV_file           | Data                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
            | Olga Soboleva                                                          | olga.soboleva@quantori.com                                             | cv_osoboleva.pdf  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
            | The Isle of Man could play a part in increasing the UK green energy ge | olga.soboleva@quantori.com                                             | cv_osoboleva.doc  | 123                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
            | Ольга Соболева                                                         | olga.soboleva@quantori.com                                             | cv_osoboleva.rtf  | О дальнейших планах рассказал аким области Женис Касымбек на брифинге в Службе центральных коммуникаций. – Идёт активное строительство новых источников возобновляемой и альтернативной энергетики. Уже реализовано 8 проектов на 228 МВт. Строится солнечная электростанция на 100 МВт под Балхашом. В Сарани планируется строительство гибридной солнечной станции с накопителями на 100 МВт и выше, – сообщил глава региона. Проекты «зелёной» энергетики реализуются с участием иностранных компаний. Инвестиции |
            | Зелёная энергетика чересчур активно развивается в Карагандинской облас | olga.soboleva@quantori.com                                             | cv_osoboleva.docx | !@#$%^&*()_+}{P:"   ?><,./\';][                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
            | O S                                                                    | olga.soboleva@quantori.com                                             | cv_osoboleva.pdf  |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
            | O-S                                                                    | olga.soboleva@quantori.com                                             | cv_osoboleva.doc  | 123                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
            | Л Д                                                                    | olga.soboleva@quantori.com                                             | cv_osoboleva.rtf  | О дальнейших планах рассказал аким области Женис Касымбек на брифинге в Службе центральных коммуникаций. – Идёт активное строительство новых источников возобновляемой и альтернативной энергетики. Уже реализовано 8 проектов на 228 МВт. Строится солнечная электростанция на 100 МВт под Балхашом. В Сарани планируется строительство гибридной солнечной станции с накопителями на 100 МВт и выше, – сообщил глава региона. Проекты «зелёной» энергетики реализуются с участием иностранных компаний. Инвестиции |
            | Л-Д                                                                    | The_Isle_of_Man_could_play_a_part_in_increasing_the_UK_green_@mail.com | cv_osoboleva.docx | The Isle of Man's potential to play a "key" role in renewable electricity generation was recognised at the latest British-Irish Council summit, the deputy chief minister has said. Climate change was among the issues discussed as Jane Poole-Wilson attended the conference in Cardiff last week. She said delegates agreed the island's central location meant it could help others "maximise" renewable output. Other issues discussed included healthcare access and youth justice. Ministers had recognised t |


    @Negative
    Scenario Outline: Check the Name field
        Given I fill the Name field with <Name>
        When I click the Send button
        Then I see the result <Result>
        Examples:
            | Name                                                                    | Result                                 |
            |                                                                         | This field is required                 |
            | 1                                                                       | Invalid name format                    |
            | 1 2                                                                     | Invalid name format                    |
            | !                                                                       | Invalid name format                    |
            | ! @                                                                     | Invalid name format                    |
            | The Isle of Man could play a part in increasing the UK green energy gen | The maximum number of characters is 70 |
            | Olga                                                                    | Invalid name format                    |
            | Ольга                                                                   | Invalid name format                    |
            | Зелёная энергетика чересчур активно развивается в Карагандинской област | The maximum number of characters is 70 |
            | Ольга_Сергеевна Соболева                                                | Invalid name format                    |
            | O_S Soboleva                                                            | Invalid name format                    |


    @Negative
    Scenario Outline: Check the Email field
        Given I fill the Email field with <Email>
        When I click the Send button
        Then I see the result <Result>
        Examples:
            | Email                                                                   | Result                                 |
            |                                                                         | This field is required                 |
            | anything@gmail                                                          | Invalid email format                   |
            | 1                                                                       | Invalid email format                   |
            | @                                                                       | Invalid email format                   |
            | @gmail.com                                                              | Invalid email format                   |
            | 1@gmail.com 2@gmail.com                                                 | Invalid email format                   |
            | The_Isle_of_Man_could_play_a_part_in_increasing_the_UK_green_e@mail.com | The maximum number of characters is 70 |


    @Negative
    Scenario Outline: Check the Message field
        Given I fill the Message field with <Data>
        When I click the Send button
        Then I see the result "The maximum number of characters is 500"
        Examples:
            | Data                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
            | The Isle of Man's potential to play a "key" role in renewable electricity generation was recognised at the latest British-Irish Council summit, the deputy chief minister has said. Climate change was among the issues discussed as Jane Poole-Wilson attended the conference in Cardiff last week. She said delegates agreed the island's central location meant it could help others "maximise" renewable output. Other issues discussed included healthcare access and youth justice. Ministers had recognised th |
            | О дальнейших планах рассказал аким области Женис Касымбек на брифинге в Службе центральных коммуникаций. – Идёт активное строительство новых источников возобновляемой и альтернативной энергетики. Уже реализовано 8 проектов на 228 МВт. Строится солнечная электростанция на 100 МВт под Балхашом. В Сарани планируется строительство гибридной солнечной станции с накопителями на 100 МВт и выше, – сообщил глава региона. Проекты «зелёной» энергетики реализуются с участием иностранных компаний. Инвестиции. |


    @Negative
    Scenario Outline: Attach CV files more than 10 Mb
        When I attach <CV_file> more than 10 Mb
        Then I see the result <Result>
        Examples:
            | CV_file | Result               |
            | cv.pdf  | Something went wrong |
            | cv.docx | Something went wrong |
            | cv.doc  | Something went wrong |
            | cv.rtf  | Something went wrong |


    @Negative
    Scenario: Do not attach CV file
        Given I fill the Name field with "Olga Soboleva"
        And I fill the Email field with "olga.soboleva@quantori.com"
        And I do not attach CV file
        And I mark checkbox
        When I click the Send button
        Then I see Attach CV in red


    @Negative
    Scenario: Do not mark checkbox
        Given I fill the Name field with "Olga Soboleva"
        And I fill the Email field with "olga.soboleva@quantori.com"
        And I attach "cv_ossoboleva.pdf" less than 10 Mb
        And I do not mark checkbox
        When I click the Send button
        Then I see checkbox label in red
