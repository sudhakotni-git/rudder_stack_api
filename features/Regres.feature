Feature: Regres

  In order to keep Regres api stable
  As a tester
  I want to make sure that everything works as expected

  Scenario: Login
    Given I make a POST request to /login
    And I set body to
      """
      {
        "email": "jexawac276@othao.com",
        "password": "RudderStack@123"
      }
      """
    When I receive a response
    Then I expect response should have a status 200
    And I store response at idToken as AuthToken

  Scenario: Add Source
    Given I make a POST request to /workspaces/2Y9m5khIdP0sS5H4rXb7SVBFIGX/sources/
    And I set header Authorization to Bearer $S{AuthToken}
    And I set body to
      """
      {
        "name": "test42",
        "sourceDefinitionId": "1b6gJdqOPOCadT3cddw8eidV591",
        "workspaceId": "2Y9m5khIdP0sS5H4rXb7SVBFIGX",
        "accountId": null,
        "config": {}
      }
      """
    When I receive a response
    Then I expect response should have a status 200
    And I store response at id as SourceId

  Scenario: Get List of Sources
    Given I make a GET request to /workspaces/2Y9m5khIdP0sS5H4rXb7SVBFIGX/sources?workspace_id=2Y9m5khIdP0sS5H4rXb7SVBFIGX
    And I set header Authorization to Bearer $S{AuthToken}
    When I receive a response
    Then I expect response should have a status 200
    And I expect response body should contain $S{SourceId}

  Scenario: Delete Source
    Given I make a DELETE request to /workspaces/2Y9m5khIdP0sS5H4rXb7SVBFIGX/sources/$S{SourceId}
    And I set header Authorization to Bearer $S{AuthToken}
    When I receive a response
    Then I expect response should have a status 200