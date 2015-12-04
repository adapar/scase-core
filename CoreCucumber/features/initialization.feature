# language: en
Feature: GUI initalization
  test the initial status of the core

  Scenario: Initialization
    Given I just turned on the core
    Then the display should be empty

