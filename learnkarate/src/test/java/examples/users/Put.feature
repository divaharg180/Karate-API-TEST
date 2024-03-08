Feature: PUT API demo case

    #Simple PUT Demo
    Scenario: Simple PUT Demo - 1
        Given url 'https://reqres.in/api/users/2'
        And request {"name": "Raghav", "job": "Tester"}
        When method PUT
        Then status 200
        And print response


