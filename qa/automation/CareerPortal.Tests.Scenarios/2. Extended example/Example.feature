Feature: 2.4.2.3. Toggle on - toggle off features

Background:
    Given user created experiment using "test.gb" file from "for scenarios/2.4.2/2.4.2.3" subdirectory

@tc:6611
@Smoke
@Automated
@BasicAuth
@CloseTabs
Scenario Outline: 2.4.2.3_01 All features should be visible by default in all views of maps
    Given user clicked on "<name of map> map" button
    When user opens Sidebar
    Then all items in the "Features" table should be turned on
    And following features should be displayed on scene:
        | Feature  | Name     |
        | source   | source   |
        | Feature1 | Feature1 |
        | Feature2 | Feature2 |
        | Feature3 | Feature3 |
        | Feature4 | Feature4 |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:6612
@Automated
@BasicAuth
@CloseTabs
@Regression
Scenario Outline: 2.4.2.3_02 User can "toggle off" all annotation features by filter in right sidebar
    Given user clicked on "<name of map> map" button
    And following features are displayed on scene:
        | Feature  | Name     |
        | source   | source   |
        | Feature1 | Feature1 |
        | Feature2 | Feature2 |
        | Feature3 | Feature3 |
        | Feature4 | Feature4 |
    When user opens Sidebar
    And user selects "All features" in "Filter by type:" dropdown
    Then number of features displayed on "<name of map>" map should be 0
    And the "Features" table should be not visible
    And the "Feature type placeholder" label text should be "Please select feature type to display in the panel"

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:6613
@Automated
@BasicAuth
@CloseTabs
@Regression
Scenario Outline: 2.4.2.3_03 User can "toggle on" all annotation features by filter in right sidebar
    Given user clicked on "<name of map> map" button
    And user opened Sidebar
    #turn off all features
    And user selected "All features" in "Filter by type:" dropdown
    #turn on all features
    When user selects "All features" in "Filter by type:" dropdown
    Then all items in the "Features" table should be turned on
    And following features should be displayed on scene:
        | Feature  | Name     |
        | source   | source   |
        | Feature1 | Feature1 |
        | Feature2 | Feature2 |
        | Feature3 | Feature3 |
        | Feature4 | Feature4 |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:6614
@Smoke
@Automated
@BasicAuth
@CloseTabs
Scenario Outline: 2.4.2.3_04 User can "toggles off" all annotation feature of a given type
    Given user clicked on "<name of map> map" button
    And user opened Sidebar
    And user selected "promoter" in "Filter by type:" dropdown
    Then following features should be displayed on scene:
        | Feature  | Name     |
        | source   | source   |
        | Feature1 | Feature1 |
        | Feature4 | Feature4 |
    And number of features displayed on "<name of map>" map should be 3
    And "Features" table should have in exact order the following rows:
        | Name     | Location | Length |
        | source   | 1 - 75   | 75     |
        | Feature1 | 2 - 18   | 17     |
        | Feature4 | 20 - 36  | 17     |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:6615
@Automated
@BasicAuth
@CloseTabs
@Regression
Scenario Outline: 2.4.2.3_05 User can "toggles on" all annotation feature of a given type
    Given user clicked on "<name of map> map" button
    And user opened Sidebar
    And user selected "Hide" option for "Feature3" row in "Features" table
    # turn off Features
    And user selected "promoter" in "Filter by type:" dropdown
    # turn on Features
    When user selects "promoter" in "Filter by type:" dropdown
    Then following features should be displayed on scene:
        | Feature  | Name     |
        | source   | source   |
        | Feature1 | Feature1 |
        | Feature2 | Feature2 |
        | Feature4 | Feature4 |
    And "Features" table should have the following rows:
        | Name     | Location | Length |
        | source   | 1 - 75   | 75     |
        | Feature1 | 2 - 18   | 17     |
        | Feature4 | 20 - 36  | 17     |
        | Feature3 | 38 - 65  | 28     |
        | Feature2 | 67 - 75  | 9      |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:6616
@Regression
@Automated
@BasicAuth
@CloseTabs
Scenario Outline: 2.4.2.3_06 User can ‘toggles off’ particular annotation feature
    Given user clicked on "<name of map> map" button
    And inside "Scene" panel: user clicked on "Feature1"
    When user opens Sidebar
    And user clicks on "Three dots" button in second row of "Features" table
    And inside "Feature row menu": user clicks on "Toggle visibility" button
    Then following features should not be displayed on scene:
        | Feature  | Name     |
        | Feature1 | Feature1 |
    And inside "Scene" panel: the following controls should be not visible:
        | control name           | type |
        | Selection box          |      |
        | Selection left margin  |      |
        | Selection right margin |      |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:6617
@Automated
@BasicAuth
@CloseTabs
@Smoke
Scenario Outline: 2.4.2.3_07 User can ‘toggles on’ particular annotation feature
    Given user clicked on "<name of map> map" button
    And user opened Sidebar
    And user clicked on "Three dots" button in fourth row of "Features" table
    And inside "Feature row menu": user clicked on "Toggle visibility" button
    When user clicks on "Three dots" button in fourth row of "Features" table
    And inside "Feature row menu": user clicks on "Toggle visibility" button
    Then following features should be displayed on scene:
        | Feature  | Name     |
        | source   | source   |
        | Feature1 | Feature1 |
        | Feature2 | Feature2 |
        | Feature3 | Feature3 |
        | Feature4 | Feature4 |
    And all items in the "Features" table should be turned on

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:6620
@Automated
@BasicAuth
@CloseTabs
@Regression
Scenario Outline: 2.4.2.3_08 Hidden feature or corresponding sequence segment are not selected on the scene by click on it from feature list
    Given user clicked on "<name of map> map" button
    And user opened Sidebar
    And user clicked on "Three dots" button in fourth row of "Features" table
    And inside "Feature row menu": user clicked on "Toggle visibility" button
    When user clicks on fourth row of "Features" table
    Then inside "Scene" panel: the following controls should be not visible:
        | control name           | type |
        | Selection box          |      |
        | Selection left margin  |      |
        | Selection right margin |      |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:7092
@Automated
@BasicAuth
@CloseTabs
@Regression
Scenario Outline: 2.4.2.3_09 User can ‘toggle off’ all features from the scene via Settings button
    Given user clicked on "<name of map> map" button
    And user opened Sidebar
    And user clicked on "Pin sidebar" button
    And user selected "Features" in "Settings" dropdown
    Then number of features displayed on "<name of map>" map should be 0
    And "Features" table should have the following rows:
        | Name     | Location | Length |
        | source   | 1 - 75   | 75     |
        | Feature1 | 2 - 18   | 17     |
        | Feature4 | 20 - 36  | 17     |
        | Feature3 | 38 - 65  | 28     |
        | Feature2 | 67 - 75  | 9      |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |

@tc:13252
@Web
@Regression
Scenario Outline: 2.4.2.3_10 Features' displaying changes are saved after refreshing the page
    Given experiment has "{Experiment_ID}" Experiment ID
    And user clicked on "<name of map> map" button
    And user opened Sidebar
    And user selected "Hide" option for "Feature3" row in "Features" table
    When user refreshes the page
    And user selects "{Experiment_ID}" in "Experiments" dropdown
    And user opens Sidebar
    Then following features should be displayed on scene:
        | Feature  | Name     |
        | source   | source   |
        | Feature1 | Feature1 |
        | Feature2 | Feature2 |
        | Feature4 | Feature4 |
    And "Features" table should have the following rows:
        | Name     | Location | Length |
        | source   | 1 - 75   | 75     |
        | Feature1 | 2 - 18   | 17     |
        | Feature4 | 20 - 36  | 17     |
        | Feature3 | 38 - 65  | 28     |
        | Feature2 | 67 - 75  | 9      |
    And items in the "Features" table should be turned according the table:
        | Name     | Status |
        | source   | hide   |
        | Feature1 | hide   |
        | Feature4 | hide   |
        | Feature3 | show   |
        | Feature2 | hide   |

    Examples:
        | name of map |
        | Linear      |
        | Sequence    |
        | Circular    |