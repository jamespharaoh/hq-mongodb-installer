Feature: Download and install is reliable

  Background:

    Given I start vagrant box "data"

  Scenario: Download checksum fails

    When I install mongo on "data" with "checksum.yml"

    Then the command stdout should include:
      """
      Download failed
      """

    And the command exit status should be non-zero

# vim: et ts=2
