*** Settings ***
Resource    ../config/import.resource
Test Setup    Setup-Open Application
Test Teardown    Teardown - Chup Anh Va Dong App
Library    DataDriver    file=../data/Data_Test_Cases_Dang_Ky_New.csv    encoding=UTF-8    delimiter=;
Test Template     Dang Ky Tai Khoan

*** Test Cases ***
Kiem Tra Dang Ky Tai Khoan Bang CSV Voi Account: ${fullname}
