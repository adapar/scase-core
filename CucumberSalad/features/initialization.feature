# language: en
Feature: GUI initalization
  Test the initial status of the core

  Scenario: Initialization
    Given I just turned on the core
    Then the window title should be SCASE
