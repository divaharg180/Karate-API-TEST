Feature: GET - Sample API test cases

    Background: GET - Background test case
        * url 'https://reqres.in/api'
        * header Accept = 'application/json'


    # Simple Get Request
    Scenario: GET - Test a Sample GET API - 1
        Given url  'https://reqres.in/api/users/2'
        When method GET
        Then status 200
        And print response
        And print responseStatus
        And print responseTime
        And print responseHeaders
        And print responseCookies

    # Simple Get Background
    Scenario: GET - Test a Sample GET API - 2
        Given path  '/users?page=2'
        When method GET
        Then status 200
        And print response
        And print responseStatus
        And print responseTime
        And print responseHeaders
        And print responseCookies
