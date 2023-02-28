*** Settings ***
Resource          ../Global/Super.robot

*** Test Cases ***
B2B_Verify positive functionalities of Freight cost_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_11    Sheet1
    Login to Vedanta Backend
    Backend_Dashboard
    Verify positive functionalities of Freight cost

B2B_Verify the City wise region Discount/Premium_Vedanta
    Verify the City wise region Discount/ Premium

B2B_Verify the positive functionalities of Add on charges_Vedanta
    Verify the Add on charges

B2B verify basic price upload with positive functionality_vedanta
    Verify Basic price upload with positive functionality

B2B verify Product price upload with positive functionality_vedanta
    Verify Product price upload with positive functionality

B2B verify volume discount upload with positive functionality_vedanta
    Verify volume discount upload with positive functionality

B2B_verify upload of financing cost excel in pricing module_vedanta
    Verify financing cost upload with positive functionality

B2B verify Depot premium option_vedanta
    Verify depot premium

B2B verify Market Corection with out giving valid till date_vedanta
    Verify Market Corection with out giving valid till date

B2B verify the page navigation after clicking on reset button in the transporter page_vedanta
    Verify the page navigation after clicking on reset button in the transporter page

B2B verify product after updating the list_vedanta
    Verify Product master

B2B verify the working of reset button_vedanta
    Verify \ category Master

B2B verify Address approval by KAM_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_11    Sheet1
    Verify Address approval by KAM

B2B verify addition of customer premium_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_11    Sheet1
    Verify addition of customer premium by KAM

B2B verify addition of customer Discount_vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_11    Sheet1
    Verify addition of customer Discount by KAM

B2B_Verify the Negative functionalities of Freight cost_Vedanta
    [Setup]    Test prerequisites    ${Filepath}    TC_11    Sheet1
    Login to Vedanta Backend
    Backend_Dashboard
    Verify Negative functionalities of Freight

B2B_Verify the \ Negative functionalities for City wise region discount_Vedanta
    Verify the \ City wise region discount_Negative

B2B_Verify the Negative functionalities of Add on charges_Vedanta
    Verify the \ Add on charges_Negative

B2B verify basic price upload with negative functionality_vedanta
    Verify Basic price upload with negative functionality

B2B_Verify Depot Premium negative functionalities_Vedanta
    Verify depot Premium_negative

B2B verify volume discount upload with negative functionality_vedanta
    Verify volume discount upload with negative functionality

B2B verify financing cost upload with negative functionality_vedanta
    Verify financing cost upload with negative functionality
