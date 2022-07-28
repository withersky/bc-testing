*** Settings ***
Library           Process

*** Keywords ***
Арифметические операции
    [Arguments]    ${1}    ${symb}    ${2}    ${myresult}
    Start Process    echo '${1}${symb}${2}' | bc    shell=True    alias=process
    Wait For Process    process
    ${result} =    Get Process Result    process    stdout=True
    Log    ${result}
    IF    '${result}' == ''
    ${result} =    Get Process Result    process    stderr=True
    Should Contain    ${result}    ${myresult}
    ELSE
    Should Be Equal    ${result}    ${myresult}
    END

Тригонометрия
    [Arguments]    ${act}    ${3}    ${myresult}
    Start Process    echo '${act}(${3})' | bc -l    shell=True    alias=process1
    Wait For Process    process1
    ${result} =    Get Process Result    process1    stdout=True    sterr=True
    Log    ${result}
    Should Contain    ${result}    ${myresult}
