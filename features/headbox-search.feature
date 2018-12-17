Feature: Searching for locations
  As an headbox user
  In order to find out a location for my party
  I want to be able to search for hotels for my city

  Scenario: Headbox search for Hotel in London
    When I search Headbox for "hotel" in "London"
    Then I should see some results

  # Scenario: Headbox search for Thermal Bath in Dublin
  #   When I search Headbox for "Thermal Bath" in "Dublin"
  #   Then I should see some results
    
  Scenario: Headbox checking meta title in serp
    When I search Headbox for "Hotel" in "London"
    Then Title of the page should contains "London"