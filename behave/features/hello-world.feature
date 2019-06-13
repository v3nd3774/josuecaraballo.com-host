Feature: Website responds.
  Scenario: Send request to website.
    Given A website
    When  we send a request to the website 
    Then  the website responds.
