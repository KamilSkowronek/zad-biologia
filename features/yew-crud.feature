Feature: I would like to edit yew

  Scenario Outline: Insert records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/yew/"
    Then I should not see "<yew>"
    And I follow "Create a new entry"
    Then I should see "Yew creation"
    When I fill in "Name" with "<yew>"
    And I fill in "Height" with "<height>"
    And I press "Create"
    Then I should see "<yew>"
    And I should see "<height>"

  Examples:
    | yew     | height |
    | grep    | 22  |
    | maple   | 54  |



  Scenario Outline: Edit records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/yew/"
    Then I should not see "<new-yew>"
    When I follow "<old-yew>"
    Then I should see "<old-yew>"
    When I follow "Edit"
    And I fill in "Name" with "<new-yew>"
    And I fill in "Height" with "<new-height>"
    And I press "Update"
    And I follow "Back to the list"
    Then I should see "<new-yew>"
    And I should see "<new-height>"
    And I should not see "<old-yew>"

  Examples:
    | old-yew      | new-yew           | new-height |
    | grep         | magnolia          | 7          |
    | maple        | acacia            | 19         |


  Scenario Outline: Delete records
    Given I am on homepage
    And I follow "Login"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "loremipsum"
    And I press "Login"
    And I go to "/admin/yew/"
    Then I should see "<yew>"
    When I follow "<yew>"
    Then I should see "<yew>"
    When I press "Delete"
    Then I should not see "<yew>"

  Examples:
    |  yew        |   
    | magnolia    |
    | acacia      |

