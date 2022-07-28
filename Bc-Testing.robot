*** Settings ***
Resource          keywords.resource

*** Test Cases ***
Main functions
    Run Keyword    Арифметические операции    55    -    1    54    # Проверяет правильность ответа выражения

Trigonometric
    Run Keyword    Тригонометрия    sqrt    256    1    # Проверяет, содержется ли число в ответе выражения
