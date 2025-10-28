*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Resource   ../libs/patcdata.robot

*** Keywords ***
Create Session To API
    Create Session    restful_api    ${BASE_URL}    headers=${HEADERS}

Patch Object By Id
    [Arguments]    ${object_id}    ${payload}
    ${response}=    PATCH On Session    restful_api    ${OBJECT_ENDPOINT}/${object_id}    json=${payload}
    Log To Console    PATCH Response: ${response.text}
    RETURN    ${response}

Verify Response Status Code
    [Arguments]    ${response}    ${expected_status}
    Should Be Equal As Integers    ${response.status_code}    ${expected_status}

Verify Response Body Contains
    [Arguments]    ${response}    ${expected_key}    ${expected_value}
    ${body}=    To JSON    ${response.text}
    Dictionary Should Contain Key    ${body}    ${expected_key}
    Should Be Equal As Strings    ${body}[${expected_key}]    ${expected_value}
