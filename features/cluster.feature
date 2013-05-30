Feature: Setup a mongodb cluster

  Background:

    Given I start vagrant box "config"
    And I start vagrant box "data"
    And I start vagrant box "shard"

  Scenario: Setup cluster

    When I install mongo on "config" with "cluster-config.yml"
    And I install mongo on "data" with "cluster-data.yml"
    And I install mongo on "shard" with "cluster-shard.yml"

    And I run mongo "2.4.3" script "cluster-setup.js" on "shard"

    Then mongo "2.4.3" test script "cluster-test.js" should work on "shard"

# vim: et ts=2
