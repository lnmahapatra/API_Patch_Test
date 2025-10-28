*** Variables ***
${VALID_ID}        7
${VALID_ID_6}      6
${INVALID_ID}      999999
${PATCH_PAYLOAD}   {"name": "Apple iPhone 11, 64GB","data": {"price": 389.99,"color": "Purple"}}
${INVALID_PAYLOAD}  {"name": 124}

#*** OF keyword***
${BASE_URL}    https://api.restful-api.dev
${OBJECT_ENDPOINT}    /objects
${HEADERS}    {"Content-Type": "application/json"}
