Feature: Setup a standalone mongo server

  Background:

    Given I start vagrant box "data"

  Scenario: Setup standalone

    When I install mongo on "data" with "standalone.yml"

    Then mongo "2.4.3" works on "data"

# vim: et ts=2
