*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Library           ../Library/CustomLibrary.py
Resource          ../Global/global_variable.robot
Resource          ../Global/Super.robot
Resource          ../Keywords/common.robot

*** Test Cases ***
B2B_Verify Frontend login with Valid Credentials_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_01    Sheet2
    Comment    Login to Vedanta Frontend Application with Valid Credentials
    Login to Vedanta Frontend
    SeleniumLibrary.Close All Browsers
    [Teardown]

B2BB_Verify Frontend login with Invalid Credentials_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_02    Sheet2
    Comment    Login to Vedanta Frontend Application with invalid Credentials
    Login to Frontend Invalid Credentials
    SeleniumLibrary.Close All Browsers

B2B_Verify Backend login with Valid Credentials_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_03    Sheet2
    Comment    Login to Vedanta Backend Application with Valid Credentials
    Login to Vedanta Backend
    SeleniumLibrary.Close All Browsers
    [Teardown]

B2B_Verify user is able to place Spot order_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Comment    Login to Vedanta Frontend Application with Valid Credentials
    Login to Vedanta Frontend
    Comment    Navigate to the Products and Go with the Spot order Flow
    Spot order Flow for TMT Product
    Comment    Login to Vedanta Backend Application with Valid Credentials
    Login to Vedanta Backend
    Comment    Navigate to the Backend Dashboard
    Backend_Dashboard
    Comment    Navigate to the Order list and Accepts the Order
    Order accept Flow
    SeleniumLibrary.Close All Browsers

B2B_Verify RFQ Order with Frieght Price_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Comment    Login to Vedanta Frontend Application with Valid Credentials
    Login to Vedanta Frontend
    Comment    Navigate to the Products and Go with the RFQ order Flow
    RFQ Flow for TMT Product in Frontend
    Comment    Login to Vedanta Backend Application with Valid Credentials
    Login to Vedanta Backend
    Comment    Verify Price Breakup Values
    Validate Frieght Price Breakup Value in Backend
    SeleniumLibrary.Close All Browsers

B2B_Verify RFQ order with Discount_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Comment    Login to Vedanta Frontend Application with Valid Credentials
    Login to Vedanta Frontend
    Comment    Navigate to the Products and Go with the RFQ order Flow
    RFQ Flow for TMT Product in Frontend
    Comment    Login to Vedanta Backend Application with Valid Credentials
    Login to Vedanta Backend
    Comment    Verify Price Breakup Values
    RFQ Flow with Customer Discount in Price Breakup
    Comment    Navigate to the Order list and Accepts the Order
    Comment    Order accept Flow
    SeleniumLibrary.Close All Browsers

B2B_Verify RFQ order without Frieght Price_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Comment    Login to Vedanta Frontend Application with Valid Credentials
    Login to Vedanta Frontend
    Comment    Navigate to the Products and Go with the RFQ order Flow
    RFQ Flow For TMT Without Frieght
    SeleniumLibrary.Close All Browsers
