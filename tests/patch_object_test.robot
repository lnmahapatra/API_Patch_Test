*** Settings ***
Documentation    Test suite for PATCH /objects/{id} endpoint of restful-api.dev
Resource         ../resources/api_keywords.robot
Resource         ../libs/patcdata.robot
Suite Setup      Create Session To API

*** Test Cases ***
Patch Existing Object Successfully
    [Documentation]    Verify that valid PATCH request updates the object successfully
    ${response}=    Patch Object By Id    ${VALID_ID}    ${PATCH_PAYLOAD}
    Verify Response Status Code    ${response}    200
    Verify Response Body Contains    ${response}    name    Updated Robot Object

Patch With Invalid ID Should Fail
    [Documentation]    Verify that PATCH request with invalid ID returns 404
    ${response}=    Patch Object By Id    ${INVALID_ID}    ${PATCH_PAYLOAD}
    Verify Response Status Code    ${response}    404

Patch With Invalid Data Should Fail
    [Documentation]    Verify that invalid payload returns 400 or error
    ${response}=    Patch Object By Id    ${VALID_ID_6}    ${INVALID_PAYLOAD}
    ${status}=    Convert To Integer    ${response.status_code}
    Run Keyword If    ${status} == 400    Log    Correctly handled invalid data
    Run Keyword If    ${status} != 400    Fail    Unexpected status code: ${status}

Patch Without Auth (If Required)
    [Documentation]    If authentication is required, verify failure without auth headers
    Create Session    no_auth    ${BASE_URL}
    ${response}=    PATCH On Session    no_auth    ${OBJECT_ENDPOINT}/${VALID_ID}    json=${PATCH_PAYLOAD}
    Should Contain Any    ${response.status_code}    401    403

Verify Partial Update Persists
    [Documentation]    Verify only sent fields are updated
    ${partial_payload}=    Create Dictionary    data={"size": "large"}
    ${response}=    Patch Object By Id    ${VALID_ID}    ${partial_payload}
    Verify Response Status Code    ${response}    200
    Verify Response Body Contains    ${response}    name    Updated Robot Object
