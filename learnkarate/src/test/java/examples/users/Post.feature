Feature: Post API Demo

    Scenario: Post Demo 1
        Given url 'https://reqres.in/api/users'
        And request {"name": "Raghav", "job": "teacher"}
        When method POST
        Then status 201
        And print response
        And print responseStatus
        And print responseTime
        And print responseHeaders
        And print responseCookies

