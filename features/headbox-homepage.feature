Feature: Checking for 3D views
  As an headbox project manager
  In order to improve quality of the business
  I want that at least 1 venue with 3D view is listed in home page

  Scenario: Checking home page listed spaces
    When I open Headbox site at "https://www.headbox.com/"
    Then I should see at least "1" element with class ".hb-3d-cube"
