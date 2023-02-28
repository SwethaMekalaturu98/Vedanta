*** Settings ***
Library           SeleniumLibrary
Library           ExcelLibrary
Library           ../Library/CustomLibrary.py
Resource          ../Global/global_variable.robot
Resource          ../Global/Super.robot
Resource          ../Keywords/common.robot

*** Test Cases ***
B2B_Verify the content of the Shipping page_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify the content of the Shipping page
    SeleniumLibrary.Close All Browsers

B2B_Verify the Positive functionalities of New Billing Address creation_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify the customer is able create New Billing Address
    SeleniumLibrary.Close All Browsers

B2B_Verify the Negative functionalities for placing an order through RFQ_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Login to Vedanta Frontend
    Verify the Existing customer is able to place an order through RFQ_Negative
    SeleniumLibrary.Close All Browsers

B2B_Verify the Positive functionalities for placing an order through RFQ_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Login to Vedanta Frontend
    Verify the Existing customer is able to place an order through RFQ_Positive
    Login to Vedanta Backend
    Backend_Dashboard
    Order accept Flow
    SeleniumLibrary.Close All Browsers

B2B_Verify user is able to place DIP Orders_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Login to Vedanta Frontend
    DIP_RFQ
    SeleniumLibrary.Close All Browsers

B2B_Verify RFQ without submitting any RFQ_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_12    Sheet1
    Verify RFQ without submitting any RFQ
    SeleniumLibrary.Close All Browsers

B2B_Verify the Prices in price Breakup_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify the add on charges are displayed on quoted price
    SeleniumLibrary.Close All Browsers

B2B_Verify placing an Order with Expected and P2 Price_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify placing an Order with Expected and P2 Price
    SeleniumLibrary.Close All Browsers

B2B_Verify the Place Spot order (condition with MT<500,LC≤90)_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify Place Spot order (condition with MT<500,LC ≤ 90)
    Login to Vedanta Backend
    Backend_Dashboard
    Order Reject Flow
    Finacial Number Backend
    SeleniumLibrary.Close All Browsers

B2B_Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Packaging,Select Payment Method-Advance) in the vedanta e portal_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Packaging,Select Payment Method-Advance)

B2B_Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Bending,Select Payment Method-Advance) in the vedanta e portal_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Bending,Select Payment Method-Advance)

B2B_Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Packaging and Bending,Select Payment Method-Advance) in the vedanta e portal_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Packaging and Bending,Select Payment Method-Advance)

B2B_Verify Spot Order Creation under this Conditions ( MT>500, Select Addon as aPackaging/ Bending / Cut Length,Select Payment Method-LC>90) in the vedanta e portal_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify Spot Order Creation under this Conditions ( MT>500, Select Addon as a Packaging/ Bending / Cut Length,Select Payment Method-LC>90)

B2B_Verify Spot Order Creation under this Conditions ( MT>500, Select Addon as aPackaging/ Bending / Cut Length,Select Payment Method-BG>60) in the vedanta e portal_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify Spot Order Creation under this Conditions ( MT>500, Select Addon as a Packaging/ Bending / Cut Length,Select Payment Method-BG>60)
    SeleniumLibrary.Close All Browsers

B2B verify error message when user clicks on place order button without selecting check box_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify error message when user clicks on place order button without selecting check box
    SeleniumLibrary.Close All Browsers

B2B_Verify page navigation_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify page navigation
    SeleniumLibrary.Close All Browsers

B2B_Verify Order by placing multiple Products_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Verify Order by placing multiple Products

B2B_Compare the price in Both Frontend and Backend_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_04    Sheet2
    Compare the price in Both Frontend and Backend
