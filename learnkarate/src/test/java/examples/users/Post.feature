Feature: Post API Demo

    Background: post background
        * url 'https://reqres.in/api'
        * header Accept = 'application/json'
        * def expectedOutput = read("postResponse.json")
        * def requestBody = read("postRequest.json")

    #Simple Post request
    Scenario: Post Demo simple -  1
        Given url 'https://reqres.in/api/users'
        And request {"name": "Raghav", "job": "teacher"}
        When method POST
        Then status 201
        And print response
        And print responseStatus
        And print responseTime
        And print responseHeaders
        And print responseCookies


    #Post with Background
    Scenario: Post Demo Background - 2
        Given path 'users'
        And request {"name": "Raghav", "job": "teacher"}
        When method POST
        Then status 201
        And print response
        And print responseStatus
        And print responseTime
        And print responseHeaders
        And print responseCookies

    #Post with Assertions
    Scenario: Post Demo - Assertions - 3
        Given path '/users'
        And request {"name": "Raghav", "job": "teacher"}
        When method POST
        Then status 201
        And match response == {"createdAt": "#ignore","name": "Raghav","job": "teacher", "id": "#string"}
        And print response
        And print responseStatus
        And print responseTime
        And print responseHeaders
        And print responseCookies

    #Post Demo with read response from file
    Scenario: Post Demo with read response from file - 4
        Given path '/users'
        And request {"name": "Raghav", "job": "teacher"}
        When method POST
        Then status 201
        And match response == expectedOutput
        And match $ == expectedOutput
        And print response

    #Post Demo with read request body from file
    Scenario: Post Demo with read request body from file - 5
        Given path '/users'
        And def projectPath = karate.properties['user.dir']
        And print projectPath
        And def filePath = projectPath+'/src/test/java/examples/users/postRequest.json'
        And print filePath

        And def requestBody1 = filePath
        ### Or ####above mention background#
        And request requestBody

        When method POST
        Then status 201

        And match response == expectedOutput
        ### Or #####
        And match $ == expectedOutput

        And print response



    #Post Demo with read body data from file and change request values
    Scenario: Post Demo with read body data from file and change request values - 6
        Given path '/users'
        And def reaqBody = read("postRequest.json")
        And set reaqBody.job = 'Software Tester'
        And request reaqBody
        When method POST
        Then status 201
        # And match response == expectedOutput
        # And match $ == expectedOutput
        And print response
