Feature: Running Cucumber with Protractor
  As a user of Protractor
  I should be able to use Cucumber
  to run my E2E tests

  @dev
  Scenario: Running Cucumber with Protractor
    Given I run Cucumber with Protractor
    Then it should still do normal tests
    Then it should expose the correct global variables

  @dev
  Scenario: Wrapping WebDriver
    Given I go on "index.html"
    Then the title should equal "My AngularJS App"

  @dev
  Scenario: Find element by css selector
    Given I go on "index.html"
    Then I can find an element by css using the selector "body"

  @dev
  Scenario: Do not find element by css selector if there is no match
    Given I go on "index.html"
    Then I cannot find an element by css using the selector "unknown_tag"