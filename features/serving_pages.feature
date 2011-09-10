Feature: Serve Pages
  The content management system should serve content

  Background:
    Given the cms database is populated


  Scenario: Serve Text Files
    Given a text file named "/test.txt" exists with:
    """
    Test Content
    """
    When I request /test.txt
    Then I should see "Test Content"

  Scenario: Guests viewing protected file
    Given a protected text file named "/test.txt" exists with:
    """
    Test Content
    """
    When I request /test.txt
    Then the response should be 403
    And I should see a page titled "Access Denied"

  Scenario: Authorized users viewing protected file
    Given a protected text file named "/test.txt" exists with:
    """
    Test Content
    """
    When login as an authorized user
    And I request /test.txt
    Then the response should be 200
    And I should see "Test Content"




