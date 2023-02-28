*** Settings ***
Resource          ../Global/Super.robot
Resource          ../Keywords/common.robot
Resource          ../Global/global_variable.robot
Library           SeleniumLibrary
Library           ExcelLibrary
Library           ../Library/CustomLibrary.py

*** Test Cases ***
B2B_Verify the Contents of Login page using password_ Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify the Contents of Login Page
    SeleniumLibrary.Close All Browsers

B2B_Verify the positive functionalities of Login page _Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify the Login Page sign in
    SeleniumLibrary.Close All Browsers

B2B_Verify the Negative functionalities of Login page _Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_05    Sheet2
    Verify the Login Page sign in_Negative
    SeleniumLibrary.Close All Browsers

B2B_Verify the functionalities of alternative Login _Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify the Login Page sign in_Alternative Login
    SeleniumLibrary.Close All Browsers

B2B verify error message when no contact is found_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify error message when no contact is found
    SeleniumLibrary.Close All Browsers

B2B_Verify KAM Mapping for Users_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify KAM Mapping for User
    SeleniumLibrary.Close All Browsers

Firefox
    Launch Browser and Navigate to URL    ${URL}    ${Browser_Name}
