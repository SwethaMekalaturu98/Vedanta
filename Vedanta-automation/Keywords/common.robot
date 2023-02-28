*** Settings ***
Library           ../Library/CustomLibrary.py
Library           SeleniumLibrary
Library           ExcelLibrary
Resource          ../Global/Super.robot
Resource          ../ObjectRepository/Radiobutton.robot

*** Keywords ***
Login to Vedanta Frontend
    Launch Frontend
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[Username]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[Password]
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm swal-button--danger']    ${SHORT_WAIT}    POP up is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm swal-button--danger']
    SeleniumLibrary.Wait Until Element Is Visible    //font[text()='Welcome To Vedanta']    ${SHORT_WAIT}    Logo is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot
    Comment    SeleniumLibrary.Click Element    ${logoutf}

Test Prerequisites
    [Arguments]    ${Filepath}    ${testcaseid}    ${Sheet1}
    ${test_prerequisite_data}    CustomLibrary.Get Ms Excel Row Values Into Dictionary Based On Key    ${Filepath}    ${testcaseid}    ${Sheet1}
    Set Global Variable    ${test_prerequisite_data}

Launch Frontend
    SeleniumLibrary.Open Browser    ${test_prerequisite_data}[URL]    Chrome
    SeleniumLibrary.Maximize Browser Window
    [Teardown]

Login to Vedanta Backend
    Launch Backend
    SeleniumLibrary.Input Text    ${usernameB}    ${test_prerequisite_data}[UsernameB]
    SeleniumLibrary.Input Text    ${passwordB}    ${test_prerequisite_data}[PasswordB]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //input[@name='captcha']    ${SHORT_WAIT}    Captcha is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //input[@name='captcha']
    Comment    CustomLibrary.Wait Until Time    5
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${loginB}    ${SHORT_WAIT}    Captcha is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Button    ${loginB}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm swal-button--danger']    ${SHORT_WAIT}    POP up is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm swal-button--danger']
    SeleniumLibrary.Wait Until Element Is Visible    ${Bdashboard}    ${SHORT_WAIT}    Dashboard Page is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot

Pricing
    SeleniumLibrary.Click Element    (//i[@Class='icon-arrow'])[1]
    SeleniumLibrary.Click Element    //span[@class='select2-arrow']
    Sleep    2
    SeleniumLibrary.Click Element    //div[contains(text(),'ESL')]
    SeleniumLibrary.Click Element    (//i[@class='icon-arrow'])[3]
    sleep    2
    SeleniumLibrary.Click Element    (//i[@class='icon-arrow'])[8]
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/freight/index/']
    SeleniumLibrary.Click Element    (//a[@class='btn btn-xs btn-blue pull-right'])[2]

RFQ Flow for TMT Product in Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}    \    a
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-block btn-danger']    ${MEDIUM_WAIT}    Button is not visible after waiting ${MEDIUM_WAIT}
    Comment    SeleniumLibrary.Scroll Element Into View    //a[text()='REBAR IS 1786 FE500 DIA 20MM-L-12 MTR']
    Sleep    5
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    550
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${SHORT_WAIT}    Product details Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${BGPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${CoPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${CreditdaysPM}
    Comment    Sleep    3
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${SelectSAddress}    ${SHORT_WAIT}    Shipping Address is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${SelectSAddress}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    Sleep    2
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="shipping-address-box-2007"]/div/a    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //*[@id="shipping-address-box-2007"]/div/a
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${SHORT_WAIT}    Summary is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${SHORT_WAIT}    RFQ list is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ2}
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    Comment    ${RFQ Order Success Message}    SeleniumLibrary.Get Text    //div[@class='alert alert-success']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${MINI_SHORT_WAIT}    Success message is not visible after waiting for ${MINI_SHORT_WAIT}
    Comment    Run Keyword If    " Your RFQ has been successfully submitted. Please await order confirmation via email and notification. " == \ "${RFQ Order Success Message}"    SeleniumLibrary.Close All Browsers
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']
    SeleniumLibrary.Click Element    ${AcceptF}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    Screenshot.Take Screenshot Without Embedding

Price_calculator_RFQ
    SeleniumLibrary.Click Element    (//i[@Class='icon-arrow'])[1]
    SeleniumLibrary.Click Element    //span[@class='select2-arrow']
    Sleep    2
    SeleniumLibrary.Click Element    //div[contains(text(),'ESL')]
    SeleniumLibrary.Click Element    (//i[@class='icon-arrow'])[3]
    sleep    2
    SeleniumLibrary.Click Element    (//i[@class='icon-arrow'])[8]
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitDep}
    SeleniumLibrary.Click Element    ${PriceCalculator}
    SeleniumLibrary.Input Text    ${SearchClient}    ${test_prerequisite_data}[searchClient]
    SeleniumLibrary.Click Element    ${Searchb}
    Sleep    3
    SeleniumLibrary.Click Element    ${SelectB}
    Sleep    2
    SeleniumLibrary.Click Element    ${Address1}
    SeleniumLibrary.Click Element    ${Address2}
    SeleniumLibrary.Click Element    ${AdvanceB}
    SeleniumLibrary.Click Element    ${DeliveredB}
    SeleniumLibrary.Click Element    ${CategoryB}
    SeleniumLibrary.Click Element    ${Categoery1B}
    SeleniumLibrary.Wait Until Element Is Visible    ${Waitcategory}
    SeleniumLibrary.Click Element    ${SelectsubC}
    Sleep    5
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitPC}
    SeleniumLibrary.Click Element    ${QuantityB}
    Sleep    5
    SeleniumLibrary.Click Element    ${RFQpricecalculator}
    Sleep    3
    SeleniumLibrary.Click Element    ${SuggestedPB}

Launch Backend
    SeleniumLibrary.Open Browser    ${test_prerequisite_data}[URLB]    ${test_prerequisite_data}[BrowserB]
    SeleniumLibrary.Maximize Browser Window

Validate Frieght Price Breakup Value in Backend
    SeleniumLibrary.Click Element    (//i[@Class='icon-arrow'])[1]
    SeleniumLibrary.Click Element    //span[@class='select2-arrow']
    SeleniumLibrary.Wait Until Element Is Visible    //div[contains(text(),'ESL')]    ${SHORT_WAIT}    ESL is not Visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[contains(text(),'ESL')]
    SeleniumLibrary.Click Element    ${ManageB}
    SeleniumLibrary.Click Element    ${RFQB}
    SeleniumLibrary.Wait Until Element Is Visible    ${SearchRFQ}    ${SHORT_WAIT}    RFQ list is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${SearchRFQ}
    SeleniumLibrary.Click Element    ${ViewRFQ}
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Suggested Price/Unit']    ${SHORT_WAIT}    Suggested Price is not visible after waiting ${SHORT_WAIT}
    Comment    ${Quote}    SeleniumLibrary.Get Text    ${suggestedpriceRFQ}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${suggestedpriceRFQ}    ${SHORT_WAIT}    Suggested Price is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${suggestedpriceRFQ}
    SeleniumLibrary.Wait Until Element Is Visible    (//td[@style='text-align:right;font-family: Courier'])[17]    ${SHORT_WAIT}    Freight Price is not visible after waiting ${SHORT_WAIT}
    ${V1}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[17]
    Comment    ${V2}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[17]
    Comment    ${V3}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[18]
    Comment    ${V4}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[19]
    Comment    ${V5}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[20]
    Comment    ${V6}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[21]
    Comment    ${V7}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[22]
    Comment    ${V8}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[23]
    Comment    ${V9}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[24]
    Comment    ${V10}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[25]
    Comment    ${V11}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[26]
    Comment    ${V12}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[27]
    Comment    ${V13}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[28]
    Comment    ${V14}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[29]
    Comment    ${V15}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[30]
    Comment    ${Quote_Price}    Evaluate    ${V1}+${V2}+${V3}+${V4}+${V5}+${V6}+${V7}+${V8}+${V9}+${V10}+${V11}+${V12}+${V13}+${V14}+${V15}
    Comment    SeleniumLibrary.Click Element    ${CrossSuggest}
    Comment    ${Price}    Convert To Integer    ${Quote_Price}
    Comment    Should Be Equal    ${Quote_Price}    ${Quote}    Both files should be equal
    SeleniumLibrary.Click Element    //span[text()='×']

Order accept Flow
    SeleniumLibrary.Scroll Element Into View    //span[@class='title' and text()='Admin']
    SeleniumLibrary.Wait Until Element Is Visible    ${OrdersB}
    SeleniumLibrary.Click Element    ${OrdersB}
    SeleniumLibrary.Wait Until Element Is Visible    ${OrderslistB}
    SeleniumLibrary.Click Element    ${OrderslistB}
    SeleniumLibrary.Wait Until Element Is Visible    (//a[@class='badge badge-primary'])[1]    ${MINI_WAIT}    View order button is not Visible after waiting${MINI_WAIT}
    SeleniumLibrary.Click Element    (//a[@class='badge badge-primary'])[1]
    SeleniumLibrary.Wait Until Element Is Visible    ${waitorder}    ${SHORT_WAIT}    Order details is not Visible after waiting${SHORT_WAIT}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    /html/body/div[2]/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/ul/li[6]/strong    ${MINI_WAIT}    View order Status is not Visible after waiting${MINI_WAIT}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //li[text()=' In Process \ \ \ \ \ \ \ \ \ \ \ \ \ \ ']    ${MINI_WAIT}    View order Status is not Visible after waiting${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AcceptOB}
    SeleniumLibrary.Click Element    ${OkB}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    /html/body/div[2]/div[3]/div/div[2]/div/div[1]/div[2]/div[1]/ul/li[6]/strong    ${MINI_WAIT}    View order Status is not Visible after waiting${MINI_WAIT}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //li[text()=' Confirmed \ \ \ \ \ \ \ \ \ \ \ \ \ \ ']    ${MINI_WAIT}    View order Status is not Visible after waiting${MINI_WAIT}

Spot order Flow for TMT Product
    SeleniumLibrary.Mouse Over    ${ProductsF}
    SeleniumLibrary.Mouse Over    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    250
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${SelectSAddress}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${SelectSAddress}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    Sleep    2
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="shipping-address-box-2007"]/div/a    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //*[@id="shipping-address-box-2007"]/div/a
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${CheckboxSpot}
    SeleniumLibrary.Click Element    ${PlaceorderSpot}
    Comment    ${Success Message in Frontend}    SeleniumLibrary.Get Text    //div[@class='swal-title']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-title']    ${MINI_SHORT_WAIT}    Success message is not visible after waiting for ${MINI_SHORT_WAIT}
    Comment    Run Keyword If    "Warning!" == \ "${Success Message in Frontend}"    SeleniumLibrary.Close All Browsers
    Screenshot.Take Screenshot

Backend_Dashboard
    SeleniumLibrary.Click Element    (//i[@Class='icon-arrow'])[1]
    SeleniumLibrary.Click Element    //span[@class='select2-arrow']
    SeleniumLibrary.Wait Until Element Is Visible    //div[contains(text(),'ESL')]    ${SHORT_WAIT}    ESL is not Visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[contains(text(),'ESL')]
    SeleniumLibrary.Wait Until Element Is Visible    //h1[text()='Dashboard ']    ${SHORT_WAIT}    Dashboard is not Visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    (//i[@class='icon-arrow'])[3]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    (//i[@class='icon-arrow'])[8]
    Comment    SeleniumLibrary.Click Element    (//i[@class='icon-arrow'])[8]

Price_calculator_Spot
    SeleniumLibrary.Click Element    (//i[@Class='icon-arrow'])[1]
    SeleniumLibrary.Click Element    //span[@class='select2-arrow']
    Sleep    2
    SeleniumLibrary.Click Element    //div[contains(text(),'ESL')]
    SeleniumLibrary.Click Element    (//i[@class='icon-arrow'])[3]
    sleep    2
    SeleniumLibrary.Click Element    (//i[@class='icon-arrow'])[8]
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitDep}
    SeleniumLibrary.Click Element    ${PriceCalculator}
    SeleniumLibrary.Input Text    ${SearchClient}    ${test_prerequisite_data}[searchClient]
    SeleniumLibrary.Click Element    ${Searchb}
    Sleep    3
    SeleniumLibrary.Click Element    ${SelectB}
    Sleep    2
    SeleniumLibrary.Click Element    ${Address1}
    SeleniumLibrary.Click Element    ${Address2}
    SeleniumLibrary.Click Element    ${AdvanceB}
    SeleniumLibrary.Click Element    ${DeliveredB}
    SeleniumLibrary.Click Element    ${CategoryB}
    SeleniumLibrary.Click Element    ${Categoery1B}
    SeleniumLibrary.Wait Until Element Is Visible    ${Waitcategory}
    SeleniumLibrary.Click Element    ${SelectsubC}
    Sleep    5
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitPC}
    SeleniumLibrary.Click Element    ${QuantityB}
    Sleep    5
    SeleniumLibrary.Click Element    ${PricecalculatorSpot}
    Sleep    5
    SeleniumLibrary.Click Element    ${Suggestlinkspot}

DIP_RFQ
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${DIP}
    SeleniumLibrary.Wait Until Element Is Visible    //b[text()=' Class K7 ']    ${MINI_WAIT}    Class K7 is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Input Text    (//input[@class='form-control'])[4]    170
    SeleniumLibrary.Input Text    (//input[@class='form-control'])[5]    3780
    SeleniumLibrary.Input Text    (//input[@class='form-control'])[6]    130
    SeleniumLibrary.Click Element    //span[text()='Add to Cart']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${MINI_WAIT}    Success Pop up is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Wait Until Element Is Visible    (//i[@class='fa fa-3x fa-shopping-cart'])[1]    ${MINI_WAIT}    Cart is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    (//i[@class='fa fa-3x fa-shopping-cart'])[1]
    SeleniumLibrary.Wait Until Element Is Visible    (//a[text()='BUY NOW'])[1]    ${MINI_WAIT}    Buy now button is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    (//a[text()='BUY NOW'])[1]
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Payment Method : ']
    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${BGPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${CoPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${CreditdaysPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${DeliveredDT}
    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Input Text    //input[@class='order_valid_date form-control']    01-12-2023
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//input[@name='inspection_service_new_implement'])[1]
    Comment    SeleniumLibrary.Click Element    (//input[@name='inspection_service_new_implement'])[2]
    SeleniumLibrary.Select From List By Label    //select[@name='agencies_vendors']    CIPET (Government Organization)
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${MINI_WAIT}    RFQ list is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //h4[text()='Your Shipping Address:']
    SeleniumLibrary.Wait Until Element Is Visible    //h4[text()='Your Billing Address:']
    SeleniumLibrary.Wait Until Element Is Visible    //strong[text()=' Category']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Name']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Specification']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Addons']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Quantity']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Expected Price/MT(Optional)']
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQ2}
    SeleniumLibrary.Click Element    ${RFQ2}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='SL No.']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='RFQ No.']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Company Name']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Quantity']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Unit']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='RFQ Date']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='RFQ Status']
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${AcceptF}
    SeleniumLibrary.Click Element    ${AcceptF}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm']    ${MINI_WAIT}    Success message is not visible after waiting for ${MINI_WAIT}
    Screenshot.Take Screenshot Without Embedding
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']

Login to Frontend Invalid Credentials
    Launch Frontend
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${MINI_WAIT}    Login Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[Username]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[Password]
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Invalid Username and/or Password']    ${SHORT_WAIT}    Error is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Page Should Contain Element    //h3[text()='Invalid Username and/or Password']
    Screenshot.Take Screenshot
    Comment    SeleniumLibrary.Click Element    ${logoutf}
    [Teardown]

RFQ Flow For TMT Without Frieght
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    Sleep    5
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    550
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Click Element    ${DeliveredDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[2]    ${SHORT_WAIT}    Shipping Address is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[2]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${ShipAF}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    Sleep    2
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    //*[@id="shipping-address-box-2007"]/div/a
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="shipping-address-box-2007"]/div/a    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //*[@id="shipping-address-box-2007"]/div/a
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${MINI_WAIT}    RFQ list is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ2}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-danger']
    Screenshot.Take Screenshot Without Embedding

RFQ Flow with Customer Discount in Price Breakup
    SeleniumLibrary.Click Element    (//i[@Class='icon-arrow'])[1]
    SeleniumLibrary.Click Element    //span[@class='select2-arrow']
    SeleniumLibrary.Wait Until Element Is Visible    //div[contains(text(),'ESL')]    ${MINI_WAIT}    ESL is not Visible after waiting${MINI_WAIT}
    SeleniumLibrary.Click Element    //div[contains(text(),'ESL')]
    SeleniumLibrary.Click Element    ${ManageB}
    SeleniumLibrary.Click Element    ${RFQB}
    SeleniumLibrary.Click Element    ${SearchRFQ}
    SeleniumLibrary.Click Element    ${ViewRFQ}
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Suggested Price/Unit']    ${SHORT_WAIT}    RFQ no. is not visible after waiting ${SHORT_WAIT}
    Comment    ${Quote}    SeleniumLibrary.Get Text    ${suggestedpriceRFQ}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${suggestedpriceRFQ}    ${SHORT_WAIT}    Suggested Price is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${suggestedpriceRFQ}
    Comment    ${V1}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[16]
    SeleniumLibrary.Wait Until Element Is Visible    (//td[@style='text-align:right;font-family: Courier'])[25]    ${SHORT_WAIT}    Discount Price is not visible after waiting ${SHORT_WAIT}
    ${V2}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[25]

Order Reject Flow
    SeleniumLibrary.Scroll Element Into View    ${OrdersB}
    SeleniumLibrary.Click Element    ${OrdersB}
    SeleniumLibrary.Wait Until Element Is Visible    ${OrderslistB}    ${SHORT_WAIT}    Order list is not Visible after waiting${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${OrderslistB}
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Click Element    ${VieworderB}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitorder}    ${SHORT_WAIT}    Order is not Visible after waiting${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@id='orderReject']
    SeleniumLibrary.Wait Until Element Is Visible    //input[@id='message']    ${SHORT_WAIT}    Text bar is not Visible after waiting${SHORT_WAIT}
    SeleniumLibrary.Input Text    //input[@id='message']    Reject
    SeleniumLibrary.Click Element    //button[text()='Confirm ']
    SeleniumLibrary.Wait Until Element Is Visible    //li[text()=' Rejected \ \ \ \ \ \ \ ']    ${SHORT_WAIT}    Rejected status is not Visible after waiting${SHORT_WAIT}

New Customer Registration Flow
    Launch Frontend
    SeleniumLibrary.Click Element    ${REGISTER}
    SeleniumLibrary.Wait Until Element Is Visible    ${Wait1R}
    SeleniumLibrary.Input Text    ${Register_mobile}    9441555570
    SeleniumLibrary.Input Text    ${Register_Company}    29AABCA1906H2ZX
    SeleniumLibrary.Wait Until Element Is Visible    //img[@id='captcha-holder']    ${MEDIUM_WAIT}    Captcha is not visible after waiting for ${MEDIUM_WAIT}
    SeleniumLibrary.Click Element    ${Captcha}
    Sleep    5
    SeleniumLibrary.Click Button    ${GET_OTP}
    Sleep    30
    SeleniumLibrary.Wait Until Element Is Visible    ${Wait2R}    ${LONG_WAIT}    OTP is not Received after waiting for ${LONG_WAIT}
    SeleniumLibrary.Click Button    ${Register_Button}
    SeleniumLibrary.Wait Until Element Is Visible    //h1[text()='Registration']    ${SHORT_WAIT}    Registration Form is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Input Text    //input[@id='first_name']    Test
    SeleniumLibrary.Input Text    //input[@id='last_name']    Tester
    SeleniumLibrary.Input Text    //input[@id='email']    testingtesterqa123@gmail.com
    SeleniumLibrary.Select From List By Label    //select[@name='state']    Karnataka
    SeleniumLibrary.Wait Until Element Is Visible    //select[@name='district']    ${SHORT_WAIT}    Hyderabad is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Select From List By Label    //select[@name='district']    Bangalore
    SeleniumLibrary.Input Text    //input[@id='ship_line1']    CONCORDE TOWER CONCORDE TOWER
    SeleniumLibrary.Input Text    //input[@id='ship_line2']    UB CITY 24, VITTAL MALLYA ROAD BANGALORE
    SeleniumLibrary.Input Text    //input[@id='ship_pin']    560001
    SeleniumLibrary.Click Button    //button[@class='multiselect dropdown-toggle btn btn-default']
    SeleniumLibrary.Wait Until Element Is Visible    //input[@class='form-control multiselect-search']    ${SHORT_WAIT}    List is not visible after waiting for ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //label[@title='PI VAB']
    Comment    SeleniumLibrary.Click Element    //label[@title='PI ESL']
    SeleniumLibrary.Click Element    //label[@title='TMT']
    Comment    SeleniumLibrary.Click Element    //label[@title='Ductile Iron Pipes']
    Comment    SeleniumLibrary.Click Element    //label[@title='Wire Rods']
    SeleniumLibrary.Click Element    (//div[@Class='col-md-6'])[2]
    SeleniumLibrary.Click Element    //label[@Class='custom-control-label form-footer-right']
    SeleniumLibrary.Click Button    //button[@id='registerSubmit']
    Screenshot.Take Screenshot

New Password For new customer
    Comment    Sleep    20
    Switch Window
    SeleniumLibrary.Open Browser    https://accounts.google.com/ServiceLogin/signinchooser?service=mail&passive=1209600&osid=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&emr=1&flowName=GlifWebSignIn&flowEntry=ServiceLogin    Chrome
    SeleniumLibrary.Input Text    //input[@type='email']    testingtesterqa123@gmail.com
    SeleniumLibrary.Click Element    //span[text()='Next']
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Welcome']    ${SHORT_WAIT}    Welcome is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Input Text    //input[@type='password']    Pass@123
    SeleniumLibrary.Click Element    //span[text()='Next']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Primary']
    SeleniumLibrary.Click Element    //*[@id=":2b"]
    SeleniumLibrary.Wait Until Element Is Visible    (//a[text()='Products'])[1]    ${SHORT_WAIT}    Product is not visible after waiting for ${SHORT_WAIT}
    Comment    SeleniumLibrary.Input Text    //input[@name='username']
    SeleniumLibrary.Click Button    //button[@id='get_otp']
    Sleep    10
    Comment    SeleniumLibrary.Input Text    //input[@id='user_otp']
    SeleniumLibrary.Click Button    //button[@id='verify_otp']
    SeleniumLibrary.Input Text    //input[@id='new-password']    Pass@123
    SeleniumLibrary.Input Text    //input[@id='retype-password']    Pass@123
    SeleniumLibrary.Click Button    //button[@id='set_password']
    SeleniumLibrary.Click Button    //button[text()='OK']

Generate_New_Customercode
    SeleniumLibrary.Input Text    //input[@placeholder='Username']    sameer.ingole@mjunction.in
    SeleniumLibrary.Input Text    //input[@name='passwd']    Pass@123
    Click Button    (//button[@type='submit'])[1]
    Wait Until Element Is Visible    //h2[text()='Pending Approvals']
    Click Element    (//i[@Class='icon-arrow'])[1]
    Click Element    //span[@class='select2-arrow']
    Sleep    2
    Click Element    //div[contains(text(),'ESL')]
    Click Element    (//i[@Class='icon-arrow'])[2]
    Comment    Scroll Element Into View    //input[@id='selection-of-order-date']
    Click Element    //a[@href='https://test-managevesale.mjunction.in/contacts/customer_contacts']
    Wait Until Element Is Visible    (//div[@class='panel-heading'])[1]
    Click Element    //a[@href='#panel_tab_example2']
    SeleniumLibrary.Input Text    //input[@name='number']    9441555570
    Click Button    (//button[text()='Search'])[2]
    Sleep    3
    Click Element    //a[text()='Address']
    Wait Until Element Is Visible    (//div[@class='panel-heading'])[1]
    Sleep    15
    Wait Until Element Is Visible    //h4[text()='Get Customer ESL']
    SeleniumLibrary.Select From List By Label    //select[@class='form-control partner_category']    2
    SeleniumLibrary.Select From List By Label    //select[@class='form-control title']    0003
    SeleniumLibrary.Select From List By Label    //select[@class='form-control region']    Andhra Pradesh
    SeleniumLibrary.Select From List By Label    //select[@class='form-control transport_zone']    Z001
    SeleniumLibrary.Select From List By Label    //select[@class='form-control industry']    41
    SeleniumLibrary.Select From List By Label    //select[@class='form-control reconcilation_ac']    0054100040
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control payment_term'])[1]    100% Advance
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control sales_organization'])[1]    ESL
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control distribution_channel'])[1]    Direct Sales
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control division'])[1]    Common Division
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control sales_district'])[1]    000004
    SeleniumLibrary.Select From List By Label    //select[@class='form-control customer_classification']    01
    SeleniumLibrary.Select From List By Label    //select[@class='form-control customer_statistics_group']    1
    SeleniumLibrary.Select From List By Label    //select[@class='form-control delivery_plant']    1000
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control shipping_condition'])[1]    01
    SeleniumLibrary.Select From List By Label    //select[@class='form-control incoterms1']    Costs and freight
    SeleniumLibrary.Select From List By Label    //select[@class='form-control incoterms2']    TXT
    SeleniumLibrary.Select From List By Label    //select[@class='form-control assignment_group']    01
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control exchange_rate'])[1]    1001
    SeleniumLibrary.Select From List By Label    //select[@class='form-control customer_price_group']    01
    SeleniumLibrary.Select From List By Label    //select[@class='form-control delivery_priority']    01
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_jocg']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_josg']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_joig']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_joug']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_zcsq']    1
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_jtc1']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control']    Choose
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control tax_category'])[1]    IN3
    SeleniumLibrary.Select From List By Label    //select[@class='form-control check_rule']    02
    SeleniumLibrary.Select From List By Label    //select[@class='form-control limit_rule']    B2B-NEW
    SeleniumLibrary.Select From List By Label    //select[@class='form-control risk_class']    999
    SeleniumLibrary.Select From List By Label    //select[@class='form-control credit_segment']    0000
    Click Button    (//button[text()='Get Customer Code'])[2]

Verify the Contents of Login Page
    Launch Frontend
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Username ']
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Password ']
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Remember Me']
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()=' Forgot your password?']
    SeleniumLibrary.Wait Until Element Is Visible    ${loginbutton}
    Screenshot.Take Screenshot

Verify the Login Page sign in
    Launch Frontend
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Username ']
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Password ']
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Remember Me']
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()=' Forgot your password?']
    SeleniumLibrary.Wait Until Element Is Visible    ${loginbutton}
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[Username]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[Password]
    SeleniumLibrary.Click Element    //label[@class='custom-control-label form-footer-right']
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm swal-button--danger']    ${SHORT_WAIT}    POP up is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm swal-button--danger']
    SeleniumLibrary.Wait Until Element Is Visible    ${logoutf}
    SeleniumLibrary.Click Element    ${logoutf}
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[Username]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[Password]
    SeleniumLibrary.Click Button    ${loginbutton}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    Screenshot.Take Screenshot

Verify the Login Page sign in_Negative
    Launch Frontend
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[Username]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[Password]
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //span[@class='errorMessage']    ${SHORT_WAIT}    Error is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Page Should Contain Element    //span[@class='errorMessage']
    Screenshot.Take Screenshot
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[UsernameB]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[PasswordB]
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //span[@class='errorMessage']    ${SHORT_WAIT}    Error is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Page Should Contain Element    //span[@class='errorMessage']
    Screenshot.Take Screenshot
    Comment    SeleniumLibrary.Input Text    ${username}
    Comment    SeleniumLibrary.Input Text    ${password}
    Comment    SeleniumLibrary.Click Button    ${loginbutton}
    Comment    Screenshot.Take Screenshot
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[UsernameF]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[PasswordF]
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Remember Me']    ${MINI_WAIT}    Checkbox is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    //label[text()='Remember Me']
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm swal-button--danger']    ${SHORT_WAIT}    POP up is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm swal-button--danger']
    SeleniumLibrary.Wait Until Element Is Visible    //font[text()='Welcome To Vedanta']    ${SHORT_WAIT}    Logo is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${logoutf}
    Comment    SeleniumLibrary.Click Element    ${logoutf}
    Comment    SeleniumLibrary.Click Element    ${Login}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot

Verify the Forgot Password link
    Launch Frontend
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Username ']
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Password ']
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Remember Me']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-vesale.mjunction.in/generate-new-password']
    SeleniumLibrary.Wait Until Element Is Visible    ${loginbutton}
    SeleniumLibrary.Click Element    //a[@href='https://test-vesale.mjunction.in/generate-new-password']
    SeleniumLibrary.Wait Until Element Is Visible    //h2[text()='Forgot Password']    ${MINI_SHORT_WAIT}    New password Page is not visible after waiting ${MINI_SHORT_WAIT}
    SeleniumLibrary.Input Text    //input[@id='username']    VED22000091

Verify the Login Page sign in_Alternative Login
    Launch Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    Sleep    5
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${SHORT_WAIT}    Product details Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    //h2[text()='Existing Customer Login']    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[Username]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[Password]
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm swal-button--danger']    ${SHORT_WAIT}    POP up is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm swal-button--danger']
    SeleniumLibrary.Wait Until Element Is Visible    //font[text()='Welcome To Vedanta']    ${SHORT_WAIT}    Logo is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    250
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${SHORT_WAIT}    Product details Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    Comment    SeleniumLibrary.Scroll Element Into View    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[2]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[2]    ${SHORT_WAIT}    Shipping Address is not visible after waiting for ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[2]
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${SHORT_WAIT}    Shipping Address is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    Comment    SeleniumLibrary.Scroll Element Into View    //*[@id="shipping-address-box-458"]/div/a
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="shipping-address-box-458"]/div/a    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    Comment    SeleniumLibrary.Click Element    //*[@id="shipping-address-box-458"]/div/a
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${CheckboxSpot}
    SeleniumLibrary.Click Element    ${PlaceorderSpot}
    Screenshot.Take Screenshot

Verify error message when no contact is found
    Launch Backend
    SeleniumLibrary.Input Text    ${usernameB}    ${test_prerequisite_data}[UsernameB]
    SeleniumLibrary.Input Text    ${passwordB}    ${test_prerequisite_data}[PasswordB]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //input[@name='captcha']    ${LONG_WAIT}    Captcha is not visible after waiting ${LONG_WAIT}
    Comment    SeleniumLibrary.Click Element    //input[@name='captcha']
    Comment    Sleep    5
    SeleniumLibrary.Wait Until Element Is Visible    ${loginB}    ${LONG_WAIT}    Captcha is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.Click Button    ${loginB}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm swal-button--danger']    ${SHORT_WAIT}    POP up is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm swal-button--danger']
    SeleniumLibrary.Wait Until Element Is Visible    ${Bdashboard}    ${SHORT_WAIT}    Dashboard Page is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    //span[text()='Select Organization']
    SeleniumLibrary.Click Element    //*[@id="s2id_select_org_id"]/a/span[1]
    SeleniumLibrary.Click Element    //*[@id="select2-drop"]/ul/li[4]/div
    SeleniumLibrary.Click Element    //span[text()='Contacts']
    SeleniumLibrary.Wait Until Element Is Visible    //input[@id='selection_of_order_analysis_date']    ${SHORT_WAIT}    Panel is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    //a[@href='https://staging-managevesale.mjunction.in/contacts/customer_contacts']
    SeleniumLibrary.Click Element    //a[@href='https://staging-managevesale.mjunction.in/contacts/customer_contacts']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Name']
    SeleniumLibrary.Click Element    //th[text()='Name']
    SeleniumLibrary.Click Element    //a[@href='#panel_tab_example2']
    SeleniumLibrary.Wait Until Element Is Visible    (//label[@for='form-field-22'])[3]    ${SHORT_WAIT}    Text is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    (//button[text()='Search'])[1]
    Comment    SeleniumLibrary.Wait Until Element Is Visible
    Comment    SeleniumLibrary.Click Element    (//button[text()='Search'])[2]
    Comment    SeleniumLibrary.Wait Until Element Is Visible
    SeleniumLibrary.Input Text    //input[@name='number']    9441555570
    SeleniumLibrary.Click Element    (//button[text()='Search'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-danger']
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    //a[@href='#panel_tab_example2']
    SeleniumLibrary.Input Text    //input[@name='number']    8106662790
    SeleniumLibrary.Click Element    (//button[text()='Search'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //a[@title='View']
    SeleniumLibrary.Click Element    //a[@title='Ledger Report']
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()='Ledger Report']
    SeleniumLibrary.Wait Until Element Is Visible    //td[text()='No Records Found.']
    Comment    SeleniumLibrary.Click Element    //a[text()='Safari Ind']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //small[text()='contact profile page']
    Comment    SeleniumLibrary.Scroll Element Into View    (//i[@class='clip-checkmark-2'])[3]
    Comment    SeleniumLibrary.Click Element    (//a[@title='click to delete file'])[2]

Verify captcha in login Page in the frontend and backend
    Launch Frontend
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[Username]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[Password]
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Please enter Captcha!']

Verify the content of the Shipping page
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    250
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${LCPM}
    SeleniumLibrary.Wait Until Element Is Visible    ${BGPM}
    SeleniumLibrary.Wait Until Element Is Visible    ${CoPM}
    SeleniumLibrary.Wait Until Element Is Visible    ${CreditdaysPM}
    SeleniumLibrary.Wait Until Element Is Visible    ${DeliveredDT}
    SeleniumLibrary.Wait Until Element Is Visible    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${SelectSAddress}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Scroll Element Into View    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ShipAF}    ${LONG_WAIT}    Shipping Address is not visible after waiting for ${LONG_WAIT}
    SeleniumLibrary.Click Element    ${ShipAF}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='btn btn-sm btn-outline-secondary btn-new-billing-address ']
    Comment    SeleniumLibrary.Scroll Element Into View    ${BillAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${BillAF}    ${LONG_WAIT}    Billing Address is not visible after waiting for ${LONG_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${BillAF}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Click Element    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='GSTN '])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //input[@id='checkGst']
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='Company '])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='Address Line1 '])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='Address Line2 '])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='Address Line3 '])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='Country'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='State'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='District'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='Zip/Postal Code '])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//label[text()='Phone Number '])[2]
    SeleniumLibrary.Click Element    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Scroll Element Into View    ${BillAF}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='/terms-conditions']
    SeleniumLibrary.Wait Until Element Is Visible    ${NextF}

Verify the content of the Order details page
    Launch Frontend
    SeleniumLibrary.Click Element    ${Login}
    SeleniumLibrary.Wait Until Element Is Visible    ${loginpage}    ${SHORT_WAIT}    Login Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Input Text    ${username}    ${test_prerequisite_data}[Username]
    SeleniumLibrary.Input Text    ${password}    ${test_prerequisite_data}[Password]
    SeleniumLibrary.Click Button    ${loginbutton}
    SeleniumLibrary.Wait Until Element Is Visible    //font[text()='Welcome To Vedanta']    ${SHORT_WAIT}    Logo is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    (//a[@href='/myaccount/profile'])[1]
    SeleniumLibrary.Click Element    //a[text()='My Orders']
    SeleniumLibrary.Wait Until Element Is Visible    (//input[@type='search'])[2]    ${MINI_WAIT}    Search bar is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Input Text    (//input[@type='search'])[2]    Confirmed
    SeleniumLibrary.Click Element    (//a[@class='badge badge-success view-order'])[1]
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Order Details']
    SeleniumLibrary.Wait Until Element Is Visible    //button[@id='ShowHideDeliveryTable']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='btn btn-primary btn-sm btn-query']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='btn btn-primary btn-sm btn-complain']
    SeleniumLibrary.Wait Until Element Is Visible    //b[text()='Order Date:']
    SeleniumLibrary.Wait Until Element Is Visible    //b[text()='Order Type:']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-success btn-sm openuploadPOmodal']

Verify the customer is able create New Billing Address
    Launch Frontend
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    250
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${BillAF}    ${LONG_WAIT}    Billing Address is not visible after waiting for ${LONG_WAIT}
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Scroll Element Into View    ${BillAF}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Click Element    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Input Text    //input[@id='gstIn']    30AAEPF6148C2ZD
    SeleniumLibrary.Click Button    //input[@id='checkGst']
    Comment    SeleniumLibrary.Select From List By Label    //select[@name='dcm_states_idShipping']    Telangana
    SeleniumLibrary.Scroll Element Into View    //select[@id='dcm_district_id']
    SeleniumLibrary.Wait Until Element Is Visible    //select[@id='dcm_district_id']    ${MINI_WAIT}    District is not visible after waiting ${MINI_WAIT}
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Select From List By Label    //select[@id='dcm_district_id']    South Goa
    Comment    SeleniumLibrary.Input Text    //input[@id='pincodeShipping']    500029
    SeleniumLibrary.Scroll Element Into View    //input[@id='phoneNumber']
    SeleniumLibrary.Input Text    //input[@id='phoneNumber']    9874012256
    SeleniumLibrary.Click Button    //input[@id='save_as_billing_address']
    Screenshot.Take Screenshot
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Click Button    //button[@class='swal-button swal-button--confirm']

Verify the customer is able create New Billing Address_Negative
    Login to Vedanta Frontend
    SeleniumLibrary.Mouse Over    ${ProductsF}
    SeleniumLibrary.Mouse Over    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    250
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${BillAF}    ${LONG_WAIT}    Billing Address is not visible after waiting for ${LONG_WAIT}
    Sleep    5
    SeleniumLibrary.Scroll Element Into View    ${BillAF}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Click Element    //a[@class='btn btn-sm btn-outline-secondary btn-new-address ']
    SeleniumLibrary.Input Text    //input[@id='gstIn']    30AAEPF6148C2ZD1
    SeleniumLibrary.Click Button    //input[@id='checkGst']
    SeleniumLibrary.Click Button    //input[@id='save_as_billing_address']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Please enter Company Name']    ${MINI_WAIT}    Error is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Button    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Input Text    //input[@id='gstIn']    30AAEPF6148C2ZD
    SeleniumLibrary.Click Button    //input[@id='checkGst']
    Comment    SeleniumLibrary.Select From List By Label    //select[@name='dcm_states_idShipping']    -- State --
    Comment    SeleniumLibrary.Scroll Element Into View    //select[@id='dcm_district_id']
    SeleniumLibrary.Wait Until Element Is Visible    //select[@id='dcm_district_id']    ${MINI_WAIT}    District is not visible after waiting ${MINI_WAIT}
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Select From List By Label    //select[@id='dcm_district_id']    --Select--
    SeleniumLibrary.Click Button    //input[@id='save_as_billing_address']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Please select district']    ${MINI_WAIT}    Error is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Button    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Input Text    //input[@id='pincodeShipping']    500029
    SeleniumLibrary.Scroll Element Into View    //input[@id='phoneNumber']
    SeleniumLibrary.Input Text    //input[@id='phoneNumber']    98755555555555555555555555555555555555
    SeleniumLibrary.Click Button    //input[@id='save_as_billing_address']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Please enter Company Name']    ${MINI_WAIT}    Error is not visible after waiting for ${MINI_WAIT}
    Screenshot.Take Screenshot
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Click Button    //button[@class='swal-button swal-button--confirm']

Verify the Existing customer is able to place an order through RFQ_Negative
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    550
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    Comment    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Please Select Payment Method, Billing Address And Shipping Address!']    ${MINI_WAIT}    Error message is not visible after waiting for ${MINI_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    Screenshot.Take Screenshot

Verify the Existing customer is able to place an order through RFQ_Positive
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='product-single-details']
    SeleniumLibrary.Input Text    ${quantityF}    685
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    Comment    Comment    SeleniumLibrary.Click Element    //span[@class='multiselect-selected-text']
    Comment    SeleniumLibrary.Click Element    //input[@value='packaging']
    Comment    SeleniumLibrary.Click Element    //label[@title='Cut Length']
    Comment    SeleniumLibrary.Click Element    //aside[@class='sidebar-product col-lg-3 padding-left-lg mobile-sidebar']
    Comment    SeleniumLibrary.Input Text    //input[@id='cut_length']    20
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${BGPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${CoPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${CreditdaysPM}
    Comment    Sleep    3
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${MINI_WAIT}    RFQ list is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //h4[text()='Your Shipping Address:']
    SeleniumLibrary.Wait Until Element Is Visible    //h4[text()='Your Billing Address:']
    SeleniumLibrary.Wait Until Element Is Visible    //strong[text()=' Category']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Name']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Specification']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Addons']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Quantity']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Expected Price/MT(Optional)']
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQ2}
    SeleniumLibrary.Click Element    ${RFQ2}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='SL No.']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='RFQ No.']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Company Name']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Quantity']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Unit']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='RFQ Date']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='RFQ Status']
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${AcceptF}
    SeleniumLibrary.Click Element    ${AcceptF}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm']    ${MINI_WAIT}    Success message is not visible after waiting for ${MINI_WAIT}
    Screenshot.Take Screenshot Without Embedding
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-success btn-sm openuploadPOmodal']    ${MINI_WAIT}    Upload PO is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //button[@class='btn btn-success btn-sm openuploadPOmodal']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    (//a[@href='/myaccount/profile'])[1]
    Comment    SeleniumLibrary.Click Element    (//a[@href='/myaccount/profile'])[1]
    Comment    SeleniumLibrary.Click Element    //a[text()='My Orders']
    Comment    SeleniumLibrary.Input Text    (//input[@type='search'])[2]    In Process
    Comment    SeleniumLibrary.Click Element    (//a[@class='badge badge-success view-order'])[1]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Order Details']
    Comment    SeleniumLibrary.Click Element    //button[@class='btn btn-success btn-sm openuploadPOmodal']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Upload Document Here (Only PDF)']
    Comment    SeleniumLibrary.Click Element    //*[@id="po_modal"]/div/div/div[2]/div[3]/div/label/figure
    Comment    Upload_File    D:\\Pricing\\Pricing Negative_1\\volume_discount_upload_sample_1672806312.xlsx
    Comment    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    Comment    SeleniumLibrary.Input Text    //input[@id='po_number']    PO9368
    Comment    SeleniumLibrary.Click Element    //input[@name='po_upload_date']
    Comment    SeleniumLibrary.Click Element    //td[text()='22']
    Comment    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //button[text()='Save changes']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-danger']    ${MINI_WAIT}    Error Message is not visible after waiting for ${MINI_WAIT}
    Comment    SeleniumLibrary.Click Element    //*[@id="po_modal"]/div/div/div[2]/div[3]/div/label/figure
    Comment    Upload_File    D:\\Sample.pdf
    Comment    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Sample.pdf']    ${SHORT_WAIT}    Pdf is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Input Text    //input[@id='po_number']    PO9370
    Comment    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //button[text()='Save changes']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    (//span[@class='badge badge-primary'])[1]
    Comment    Screenshot.Take Screenshot Without Embedding

Upload_File
    [Arguments]    ${PATH}
    sleep    3s
    Comment    AutoItLibrary.Wait For Active Window    Open
    AutoItLibrary.Process Wait    ${EMPTY}    1
    AutoItLibrary.Control Send    Open    ${EMPTY}    [CLASS:Edit]    ${PATH}
    AutoItLibrary.Process Wait    ${EMPTY}    2
    AutoItLibrary.Control Command    Open    ${EMPTY}    [CLASS:ComboBox; INSTANCE:2]    SelectString    All Files (.)
    AutoItLibrary.Process Wait    ${EMPTY}    2
    AutoItLibrary.Control Click    Open    ${EMPTY}    [TEXT:&Open]
    Sleep    2

Verify positive functionalities of Freight cost
    Comment    CustomLibrary.Wait Until Time    5
    Pricing Navigation
    Freeze Price
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/freight/index/']    ${SHORT_WAIT}    Freight is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/freight/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='File']    ${SHORT_WAIT}    File is not visible after waiting ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\freight_upload_sample_1671102062.xlsx
    SeleniumLibrary.Click Element    //button[text()='Submit']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    Pricing Navigation
    Approve Pending file
    Comment    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Sign in to your account']
    Comment    SeleniumLibrary.Input Text    ${usernameB}    ${test_prerequisite_data}[UsernameB]
    Comment    SeleniumLibrary.Input Text    ${passwordB}    ${test_prerequisite_data}[PasswordB]
    Comment    SeleniumLibrary.Click Button    ${loginB}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${Bdashboard}    ${SHORT_WAIT}    Dashboard Page is not visible after waiting ${SHORT_WAIT}
    Comment    Backend_Dashboard
    Comment    Pricing Navigation
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/freight/index/']    ${SHORT_WAIT}    Freight is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/freight/index/']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='File']    ${SHORT_WAIT}    File is not visible after waiting ${SHORT_WAIT}
    Comment    CustomLibrary.Wait Until Time    15
    Comment    SeleniumLibrary.Click Element    //input[@class='form-control input-sm']
    Comment    SeleniumLibrary.Input Text    //input[@class='form-control input-sm']    122001
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //td[text()='122001']    ${SHORT_WAIT}    Uploaded Freight is not visible after waiting ${SHORT_WAIT}

Verify KAM Mapping for User
    Launch Backend
    SeleniumLibrary.Input Text    ${usernameB}    ${test_prerequisite_data}[UsernameB]
    SeleniumLibrary.Input Text    ${passwordB}    ${test_prerequisite_data}[PasswordB]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //input[@name='captcha']    ${LONG_WAIT}
    Comment    SeleniumLibrary.Click Element    //input[@name='captcha']
    Comment    Sleep    5
    SeleniumLibrary.Wait Until Element Is Visible    ${loginB}    ${LONG_WAIT}    Captcha is not visible after waiting ${LONG_WAIT}
    SeleniumLibrary.Click Button    ${loginB}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm swal-button--danger']    ${SHORT_WAIT}    POP up is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm swal-button--danger']
    SeleniumLibrary.Wait Until Element Is Visible    ${Bdashboard}    ${SHORT_WAIT}    Dashboard Page is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    //span[text()='Select Organization']
    SeleniumLibrary.Click Element    //*[@id="s2id_select_org_id"]/a/span[1]
    SeleniumLibrary.Click Element    //*[@id="select2-drop"]/ul/li[4]/div
    SeleniumLibrary.Click Element    //span[text()='Contacts']
    SeleniumLibrary.Wait Until Element Is Visible    //input[@id='selection_of_order_analysis_date']    ${SHORT_WAIT}    Panel is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    //a[@href='https://staging-managevesale.mjunction.in/contacts/customer_contacts']
    SeleniumLibrary.Click Element    //a[@href='https://staging-managevesale.mjunction.in/contacts/customer_contacts']
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Name']
    SeleniumLibrary.Click Element    //th[text()='Name']
    SeleniumLibrary.Click Element    //a[@href='#panel_tab_example2']
    SeleniumLibrary.Wait Until Element Is Visible    (//label[@for='form-field-22'])[3]    ${SHORT_WAIT}    Text is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    (//button[text()='Search'])[1]
    SeleniumLibrary.Input Text    //input[@name='number']    8106662790
    SeleniumLibrary.Click Element    (//button[text()='Search'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //a[@title='View']
    SeleniumLibrary.Click Element    //a[@title='View']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='#panel_overview']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='#panel_kam_mapping']
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()='SAP Codes']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='#configuration_exceptions']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='#configuration_delivery_type']
    SeleniumLibrary.Click Element    //a[@href='#panel_kam_mapping']
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="panel_kam_mapping"]/div[4]/div/div[1]/button    ${SHORT_WAIT}    Save Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //*[@id="panel_kam_mapping"]/div[4]/div/div[1]/button
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Please Select KAM']    ${SHORT_WAIT}    Error is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='#panel_kam_mapping']
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="s2id_esl_kam_id"]/a/span[1]
    SeleniumLibrary.Click Element    //*[@id="s2id_esl_kam_id"]/a/span[1]
    SeleniumLibrary.Click Element    //div[text()='Garima Jain (garima.jain)']
    SeleniumLibrary.Click Element    //*[@id="s2id_esl_category_id0"]/a/span[1]
    SeleniumLibrary.Click Element    //div[text()='Wire Rods']
    SeleniumLibrary.Click Element    //*[@id="panel_kam_mapping"]/div[4]/div/div[1]/button
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot

Verify KAM Mapping for Users_Negative

Verify RFQ without submitting any RFQ
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    //td[text()='No Data Available!']
    Screenshot.Take Screenshot

Verify the add on charges are displayed on quoted price
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='product-single-details']
    SeleniumLibrary.Input Text    ${quantityF}    150
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    //span[@class='multiselect-selected-text']
    SeleniumLibrary.Click Element    //label[@title='Cut Length']
    SeleniumLibrary.Click Element    //aside[@class='sidebar-product col-lg-3 padding-left-lg mobile-sidebar']
    SeleniumLibrary.Input Text    //input[@id='cut_length']    20
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    Comment    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Click Element    ${LCPM}
    SeleniumLibrary.Click Element    (//input[@class='credit_days number-valid cc_days'])[2]
    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[2]    100
    SeleniumLibrary.Click Element    ${DeliveredDT}
    SeleniumLibrary.Wait Until Element Is Visible    ${ShipAF}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${SHORT_WAIT}    RFQ list is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Expected Price/MT(Optional)']
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQ2}
    SeleniumLibrary.Click Element    ${RFQ2}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${MINI_WAIT}    Success message is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${AcceptF}
    SeleniumLibrary.Click Element    ${AcceptF}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm']    ${MINI_WAIT}    Success message is not visible after waiting for ${MINI_WAIT}
    Screenshot.Take Screenshot Without Embedding
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    Login to Vedanta Backend
    Backend_Dashboard
    SeleniumLibrary.Click Element    ${ManageB}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQB}    ${SHORT_WAIT}    RFQ is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQB}
    SeleniumLibrary.Wait Until Element Is Visible    ${SearchRFQ}    ${SHORT_WAIT}    RFQ list is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${SearchRFQ}
    SeleniumLibrary.Click Element    ${ViewRFQ}
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Suggested Price/Unit']    ${SHORT_WAIT}    Suggested Price is not visible after waiting ${SHORT_WAIT}
    Comment    ${Quote}    SeleniumLibrary.Get Text    ${suggestedpriceRFQ}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${suggestedpriceRFQ}    ${SHORT_WAIT}    Suggested Price is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    ${suggestedpriceRFQ}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    (//td[@style='text-align:right;font-family: Courier'])[18]    ${SHORT_WAIT}    Addon Price is not visible after waiting ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    Comment    ${V1}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[17]
    Comment    ${V2}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[18]
    Comment    ${V3}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[29]
    Comment    ${V4}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[30]
    ${Quote}    SeleniumLibrary.Get Text    ${suggestedpriceRFQ}
    ${Quote}    Convert To String    ${Quote}
    SeleniumLibrary.Wait Until Element Is Visible    ${suggestedpriceRFQ}    ${SHORT_WAIT}    Suggested Price is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${suggestedpriceRFQ}
    CustomLibrary.Wait Until Time    1
    ${V1}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[16]
    ${V2}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[17]
    ${V3}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[18]
    ${V4}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[19]
    ${V5}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[20]
    ${V6}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[21]
    ${V7}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[22]
    ${V8}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[23]
    ${V9}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[24]
    ${V10}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[25]
    ${V11}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[26]
    ${V12}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[27]
    ${V13}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[28]
    ${V14}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[29]
    ${V15}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[30]
    ${Quote_Price}    Evaluate    ${V1}+${V2}+${V3}+${V4}+${V5}+${V6}+${V7}+${V8}+${V9}+${V10}+${V11}+${V12}+${V13}+${V14}+${V15}
    SeleniumLibrary.Click Element    ${CrossSuggest}
    ${Quote_Price}    Convert To String    ${Quote_Price}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    Should Not Be Equal    ${Quote_Price}    ${Quote}    Both files should be equal

Verify reason while rejecting address
    Login to Vedanta Backend
    Backend_Dashboard
    SeleniumLibrary.Click Element    //span[text()='Contacts']
    SeleniumLibrary.Wait Until Element Is Visible    /html/body/div[2]/div[1]/div/ul/li[3]/ul/li[15]/a    ${SHORT_WAIT}    Customer list is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    /html/body/div[2]/div[1]/div/ul/li[3]/ul/li[15]/a
    SeleniumLibrary.Wait Until Element Is Visible    (//div[@class='panel-heading'])[1]
    SeleniumLibrary.Click Element    //a[@href='#panel_tab_example2']
    SeleniumLibrary.Input Text    //input[@name='number']    9078631542
    SeleniumLibrary.Click Element    (//button[text()='Search'])[2]
    Wait Until Element Is Visible    //a[@title='Manage Address']    ${SHORT_WAIT}    Address tab is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@title='Manage Address']
    Wait Until Element Is Visible    (//div[@class='panel-heading'])[1]
    SeleniumLibrary.Click Element    (//button[@class='btn btn-block btn-danger'])[2]

Verify the City wise region Discount/ Premium
    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/city_wise_region_discount/index/']    ${SHORT_WAIT}    Citywise Region is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/city_wise_region_discount/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    Col is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\city_wise_region_discount_upload_sample_1671084181.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    (//button[@class='btn btn-primary'])[1]    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//button[@class='btn btn-primary'])[1]
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    Pricing Navigation
    Approve Pending file
    Comment    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Sign in to your account']
    Comment    Login to Vedanta Backend
    Comment    Backend_Dashboard
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Products ']    ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //span[text()='Products ']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    (//i[@class="icon-arrow"])[8]    ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    (//i[@class="icon-arrow"])[8]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/city_wise_region_discount/index/']    ${SHORT_WAIT}    Citywise Region is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/city_wise_region_discount/index/']
    Comment    SeleniumLibrary.Click Element    (//span[text()='---Select---'])[1]
    Comment    SeleniumLibrary.Click Element    //div[text()='TMT']
    Comment    SeleniumLibrary.Click Element    //span[text()='-- Products --']
    Comment    SeleniumLibrary.Click Element    //div[text()='REBAR IS FE500DCRS DIA 10MM-L-12 MTR']
    Comment    SeleniumLibrary.Click Element    //span[text()='-- State --']
    Comment    SeleniumLibrary.Click Element    //div[text()='Telangana']
    Comment    SeleniumLibrary.Click Element    //span[text()='-- City --']
    Comment    SeleniumLibrary.Click Element    //div[text()='Hyderabad']
    Comment    SeleniumLibrary.Click Element    //input[@name='search']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //td[text()='111.00']
    Comment    Screenshot.Take Screenshot

Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Products ']    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[text()='Products ']
    SeleniumLibrary.Wait Until Element Is Visible    (//i[@class="icon-arrow"])[8]    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//i[@class="icon-arrow"])[8]

Verify the Add on charges
    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[contains(text(),'Add On')]    ${SHORT_WAIT}    Addon is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[contains(text(),'Add On')]
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()='Addon Pricing']    ${MINI_WAIT}    Addon Pricing is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //a[text()='Addon Pricing']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    File Col is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\add_on_price_upload_sample_1671109616.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-primary']
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']
    Pricing Navigation
    Approve Pending file
    Comment    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Sign in to your account']    ${SHORT_WAIT}    Text is not visible after waiting ${SHORT_WAIT}
    Comment    Login to Vedanta Backend
    Comment    Backend_Dashboard
    Comment    Pricing Navigation
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[contains(text(),'Add On')]    ${SHORT_WAIT}    Addon is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[contains(text(),'Add On')]
    Comment    SeleniumLibrary.Click Element    //a[text()='Addon Pricing']

Verify Basic price upload with positive functionality
    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/product_price/upload_category_based_pricing/']    ${SHORT_WAIT}    Category Based Price is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/product_price/upload_category_based_pricing/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    File Col is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\product_price_upload_sample_1671123458.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@value='Submit']    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@value='Submit']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    Pricing Navigation
    Approve Pending file
    Comment    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/sign-out/']    ${SHORT_WAIT}    Signout is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    Comment    Login to Vedanta Backend
    Comment    Backend_Dashboard
    Comment    Pricing Navigation
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/product_price/upload_category_based_pricing/']    ${SHORT_WAIT}    Category Baed Price is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/product_price/upload_category_based_pricing/']

Freeze Price
    SeleniumLibrary.Wait Until Element Is Visible    //i[@class='fa fa-cog']    ${SHORT_WAIT}    Site settings is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //i[@class='fa fa-cog']
    SeleniumLibrary.Wait Until Element Is Visible    //span[@class='slider round']    ${SHORT_WAIT}    Slider is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[@class='slider round']
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //p[text()='Freeze order status updated successfully.']    ${SHORT_WAIT}    Success message is not visible after waiting for${SHORT_WAIT}

Unfreeze Price
    SeleniumLibrary.Wait Until Element Is Visible    //i[@class='fa fa-cog']    ${SHORT_WAIT}    Site settings is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //i[@class='fa fa-cog']
    SeleniumLibrary.Wait Until Element Is Visible    //span[@class='slider round']    ${SHORT_WAIT}    Slider is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[@class='slider round']
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //p[text()='Freeze order status updated successfully.']    ${SHORT_WAIT}    Success message is not visible after waiting for${SHORT_WAIT}

Approve Pending file
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/pricing/pending_approval_status/']
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/pricing/pending_approval_status/']
    SeleniumLibrary.Wait Until Element Is Visible    //button[text()='Search']
    SeleniumLibrary.Click Element    //button[text()='Approve']
    SeleniumLibrary.Wait Until Element Is Visible    //input[@name='comment']
    SeleniumLibrary.Input Text    //input[@name='comment']    Testing
    SeleniumLibrary.Click Element    //input[@id='approval-form-submit']
    CustomLibrary.Wait Until Time    5
    Comment    SeleniumLibrary.Click Element    //button[text()='Reject']
    SeleniumLibrary.Wait Until Element Is Visible    //button[text()='Search']

Verify Product price upload with positive functionality
    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/product_price/index/']    ${SHORT_WAIT}    Productprice is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/product_price/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    Colis not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\product_price_upload_sample_1671110334.xlsx
    SeleniumLibrary.Click Element    (//input[@type='radio'])[1]
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    Pricing Navigation
    Approve Pending file
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/product_price/index/']    ${SHORT_WAIT}    ProductPrice is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/product_price/index/']
    Comment    SeleniumLibrary.Input Text    //*[@id="table_filter"]/label/input    REBAR IS 1786 FE500D DIA 25MM-L-12 MTR

Verify volume discount upload with positive functionality
    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/volume_discount/index/']    ${SHORT_WAIT}    File is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/volume_discount/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    File is not visible after waiting ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\volume_discount_upload_sample_1671125668.xlsx
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']

Verify financing cost upload with positive functionality
    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/financing_cost/index/']    ${SHORT_WAIT}    FinancingCost is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/financing_cost/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    Col is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\financing_cost_upload_sample_1671125408.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@value='Submit']    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@value='Submit']
    Pricing Navigation
    Approve Pending file

Verify Address approval by KAM
    Login to Vedanta Backend
    Backend_Dashboard
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Contacts']    ${SHORT_WAIT}    Contacts Heading is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[text()='Contacts']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/contacts/customer_contacts']    ${SHORT_WAIT}    Customer list is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/contacts/customer_contacts']
    SeleniumLibrary.Wait Until Element Is Visible    (//div[@class='panel-heading'])[1]    ${SHORT_WAIT}    Pannel Heading is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='#panel_tab_example2']
    SeleniumLibrary.Input Text    //input[@name='number']    9078631542
    SeleniumLibrary.Click Element    (//button[text()='Search'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()='Address']    ${SHORT_WAIT}    Address tab is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[text()='Address']
    SeleniumLibrary.Wait Until Element Is Visible    (//div[@class='panel-heading'])[1]    ${SHORT_WAIT}    Pannel Heading is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    (//a[@class='btn btn-block btn-info'])[2]    ${SHORT_WAIT}    Get Customer code button is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//a[@class='btn btn-block btn-info'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-block btn-info']    ${SHORT_WAIT}    Get Customer code button is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='btn btn-block btn-info']
    SeleniumLibrary.Wait Until Element Is Visible    //h4[text()='Get Customer ESL']    ${SHORT_WAIT}    Get Customer code Page is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Select From List By Label    //select[@class='form-control partner_category']    2
    SeleniumLibrary.Select From List By Label    //select[@class='form-control title']    0003
    SeleniumLibrary.Select From List By Label    //select[@class='form-control region']    Delhi
    SeleniumLibrary.Select From List By Label    //select[@class='form-control transport_zone']    Z001
    SeleniumLibrary.Select From List By Label    //select[@class='form-control industry']    41
    SeleniumLibrary.Select From List By Label    //select[@class='form-control reconcilation_ac']    0054100040
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control payment_term'])[1]    100% Advance
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control sales_organization'])[1]    ESL
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control distribution_channel'])[1]    Direct Sales
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control division'])[1]    Common Division
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control sales_district'])[1]    000004
    SeleniumLibrary.Select From List By Label    //select[@class='form-control customer_classification']    01
    SeleniumLibrary.Select From List By Label    //select[@class='form-control customer_statistics_group']    1
    SeleniumLibrary.Select From List By Label    //select[@class='form-control delivery_plant']    1000
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control shipping_condition'])[1]    01
    SeleniumLibrary.Select From List By Label    //select[@class='form-control incoterms1']    Costs and freight
    SeleniumLibrary.Select From List By Label    //select[@class='form-control incoterms2']    TXT
    SeleniumLibrary.Select From List By Label    //select[@class='form-control assignment_group']    01
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control exchange_rate'])[1]    1001
    SeleniumLibrary.Select From List By Label    //select[@class='form-control customer_price_group']    01
    SeleniumLibrary.Select From List By Label    //select[@class='form-control delivery_priority']    01
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_jocg']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_josg']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_joig']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_joug']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_zcsq']    1
    SeleniumLibrary.Select From List By Label    //select[@class='form-control tax_classification_jtc1']    Taxable
    SeleniumLibrary.Select From List By Label    //select[@class='form-control']    Choose
    SeleniumLibrary.Select From List By Label    (//select[@class='form-control tax_category'])[1]    IN3
    SeleniumLibrary.Select From List By Label    //select[@class='form-control check_rule']    02
    SeleniumLibrary.Select From List By Label    //select[@class='form-control limit_rule']    B2B-NEW
    SeleniumLibrary.Select From List By Label    //select[@class='form-control risk_class']    999
    SeleniumLibrary.Select From List By Label    //select[@class='form-control credit_segment']    0000
    SeleniumLibrary.Click Element    (//button[text()='Get Customer Code'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Success!']    ${SHORT_WAIT}    Success message is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-block btn-primary btm-2']    ${SHORT_WAIT}    Customer Update button is not visible after waiting for${SHORT_WAIT}

Verify Place Spot order (condition with MT<500,LC ≤ 90)
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    5
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    Comment    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Wait Until Element Is Visible    ${LCPM}
    SeleniumLibrary.Click Element    ${LCPM}
    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[2]    80
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${SHORT_WAIT}    Summary is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${CheckboxSpot}
    SeleniumLibrary.Click Element    ${PlaceorderSpot}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${SHORT_WAIT}    Success pop up is not visible after waiting for ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Order Details']    ${SHORT_WAIT}    Order details is not visible after waiting for ${SHORT_WAIT}
    Comment    ${S1}    SeleniumLibrary.Get Text    (//td[@align='right'])[1]
    Comment    ${S2}    SeleniumLibrary.Get Text    (//td[@align='right'])[2]
    Comment    ${S3}    SeleniumLibrary.Get Text    (//td[@align='right'])[3]
    Comment    ${Net Price}    Evaluate    ${S1}+${S2}+${S3}
    Comment    Should Be Equal    ${Net Price}    ${Grand total}    Both Values should be equal
    Comment    SeleniumLibrary.Click Element    //*[@id="po_modal"]/div/div/div[2]/div[3]/div/label/figure
    Comment    Upload_File    D:\\Sample.pdf
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Sample.pdf']    ${SHORT_WAIT}    Pdf is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Input Text    //input[@id='po_number']
    Comment    CustomLibrary.Wait Until Time    5
    Comment    SeleniumLibrary.Click Element    //button[text()='Save changes']

Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Packaging,Select Payment Method-Advance)
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    5
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    //button[@class='multiselect dropdown-toggle btn btn-default btn-outline-secondary']
    SeleniumLibrary.Wait Until Element Is Visible    //label[@title='Packaging']    ${MINI_WAIT}    Packaging is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //label[@title='Packaging']
    SeleniumLibrary.Click Element    //aside[@class='sidebar-product col-lg-3 padding-left-lg mobile-sidebar']
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${LCPM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[2]    80
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${SHORT_WAIT}    Summary is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${CheckboxSpot}
    SeleniumLibrary.Click Element    ${PlaceorderSpot}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${SHORT_WAIT}    Success pop up is not visible after waiting for ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']

Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Bending,Select Payment Method-Advance)
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    5
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    //button[@class='multiselect dropdown-toggle btn btn-default btn-outline-secondary']
    SeleniumLibrary.Wait Until Element Is Visible    //label[@title='Bending']    ${MINI_WAIT}    Bending is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //label[@title='Bending']
    SeleniumLibrary.Click Element    //aside[@class='sidebar-product col-lg-3 padding-left-lg mobile-sidebar']
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${LCPM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[2]    80
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${SHORT_WAIT}    Summary is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${CheckboxSpot}
    SeleniumLibrary.Click Element    ${PlaceorderSpot}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${SHORT_WAIT}    Success pop up is not visible after waiting for ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']

Verify Spot Order Creation under this Conditions ( MT<500, Select Addon as a Packaging and Bending,Select Payment Method-Advance)
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    50
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    //button[@class='multiselect dropdown-toggle btn btn-default btn-outline-secondary']
    SeleniumLibrary.Wait Until Element Is Visible    //label[@title='Packaging']    ${MINI_WAIT}    Packaging is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //label[@title='Packaging']
    SeleniumLibrary.Click Element    //label[@title='Bending']
    SeleniumLibrary.Click Element    //aside[@class='sidebar-product col-lg-3 padding-left-lg mobile-sidebar']
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${LCPM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[2]    80
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${SHORT_WAIT}    Summary is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${CheckboxSpot}
    SeleniumLibrary.Click Element    ${PlaceorderSpot}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${SHORT_WAIT}    Success pop up is not visible after waiting for ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']

Verify Spot Order Creation under this Conditions ( MT>500, Select Addon as a Packaging/ Bending / Cut Length,Select Payment Method-LC>90)
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    50
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    //button[@class='multiselect dropdown-toggle btn btn-default btn-outline-secondary']
    SeleniumLibrary.Wait Until Element Is Visible    //label[@title='Packaging']    ${MINI_WAIT}    Packaging is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //label[@title='Packaging']
    SeleniumLibrary.Click Element    //label[@title='Bending']
    SeleniumLibrary.Click Element    //label[@title='Cut Length']
    SeleniumLibrary.Click Element    //aside[@class='sidebar-product col-lg-3 padding-left-lg mobile-sidebar']
    SeleniumLibrary.Input Text    //input[@id='cut_length']    5
    SeleniumLibrary.Click Element    ${buynow}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    Comment    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Wait Until Element Is Visible    ${LCPM}
    SeleniumLibrary.Click Element    ${LCPM}
    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[2]    100
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${MINI_WAIT}    RFQ list is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQ2}
    SeleniumLibrary.Click Element    ${RFQ2}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${AcceptF}
    SeleniumLibrary.Click Element    ${AcceptF}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm']    ${MINI_WAIT}    Success message is not visible after waiting for ${MINI_WAIT}
    Screenshot.Take Screenshot Without Embedding
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']

Verify Spot Order Creation under this Conditions ( MT>500, Select Addon as a Packaging/ Bending / Cut Length,Select Payment Method-BG>60)
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    60
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    //button[@class='multiselect dropdown-toggle btn btn-default btn-outline-secondary']
    SeleniumLibrary.Wait Until Element Is Visible    //label[@title='Packaging']    ${MINI_WAIT}    Packaging is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //label[@title='Packaging']
    SeleniumLibrary.Click Element    //label[@title='Bending']
    SeleniumLibrary.Click Element    //label[@title='Cut Length']
    SeleniumLibrary.Click Element    //aside[@class='sidebar-product col-lg-3 padding-left-lg mobile-sidebar']
    SeleniumLibrary.Input Text    //input[@id='cut_length']    5
    SeleniumLibrary.Click Element    ${buynow}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    Comment    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${LCPM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[2]    100
    SeleniumLibrary.Wait Until Element Is Visible    ${BGPM}
    SeleniumLibrary.Click Element    ${BGPM}
    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[3]    80
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${MINI_WAIT}    RFQ list is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQ2}
    SeleniumLibrary.Click Element    ${RFQ2}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${AcceptF}
    SeleniumLibrary.Click Element    ${AcceptF}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm']    ${MINI_WAIT}    Success message is not visible after waiting for ${MINI_WAIT}
    Screenshot.Take Screenshot Without Embedding
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']

Verify error message when user clicks on place order button without selecting check box
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    350
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${LCPM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    SeleniumLibrary.Input Text    (//input[@class='credit_days number-valid cc_days'])[2]    80
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${SHORT_WAIT}    Summary is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='collapsed']
    Comment    SeleniumLibrary.Click Element    //a[@class='collapsed']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //input[@class='form-control form-control-sm']
    Comment    SeleniumLibrary.Input Text    //input[@class='form-control form-control-sm']    AP1WZV37
    Comment    SeleniumLibrary.Click Element    //button[@class='btn btn-sm btn-outline-secondary']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${LONG_WAIT}    Success message is not visible after waiting for ${LONG_WAIT}
    Comment    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Click Element    ${PlaceorderSpot}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon swal-icon--warning']    ${SHORT_WAIT}    Error message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Click Element    ${CheckboxSpot}
    SeleniumLibrary.Click Element    ${PlaceorderSpot}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${SHORT_WAIT}    Success pop up is not visible after waiting for ${SHORT_WAIT}
    Screenshot.Take Screenshot
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']

Verify addition of customer premium by KAM
    Login to Vedanta Backend
    Backend_Dashboard
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Contacts']    ${SHORT_WAIT}    Contacts Heading is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[text()='Contacts']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/contacts/customer_contacts']    ${SHORT_WAIT}    Customer list is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/contacts/customer_contacts']
    SeleniumLibrary.Wait Until Element Is Visible    (//div[@class='panel-heading'])[1]    ${SHORT_WAIT}    Pannel Heading is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='#panel_tab_example2']
    SeleniumLibrary.Input Text    //input[@name='number']    9078631542
    SeleniumLibrary.Click Element    (//button[text()='Search'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //a[@title='Manage Customer Premiums']    ${SHORT_WAIT}    Customer premium tab is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@title='Manage Customer Premiums']
    SeleniumLibrary.Wait Until Element Is Visible    //h1[text()='Company Premium']    ${SHORT_WAIT}    Customer premium heading is not visible after waiting for${SHORT_WAIT}
    Comment    SeleniumLibrary.Select From List By Label    //span[text()='--All Category--']    Ductile Iron Pipes
    SeleniumLibrary.Click Element    //span[text()='--All Category--']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Ductile Iron Pipes']    ${SHORT_WAIT}    DIP is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[text()='Ductile Iron Pipes']
    Comment    SeleniumLibrary.Select From List By Label    //select[@class='form-control product_list']    All Products
    SeleniumLibrary.Click Element    //select[@class='form-control product_list']
    SeleniumLibrary.Wait Until Element Is Visible    //option[text()=' All Products ']    ${SHORT_WAIT}    Products are not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //option[text()=' All Products ']
    Comment    SeleniumLibrary.Select From List By Label    //span[text()='--All BTP--']    SAP Code: 8500006211, Plot no 8: Sri Hari Gardens Chittoor \ 517001 Andhra Pradesh Chittoor
    SeleniumLibrary.Click Element    //span[text()='--All BTP--']
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Wait Until Element Is Visible    (//span[@class='select2-match'])[2]    ${SHORT_WAIT}    BTP Address is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//span[@class='select2-match'])[2]
    SeleniumLibrary.Input Text    //input[@name='premium_amount']    50
    SeleniumLibrary.Click Element    //input[@class='btn btn-success']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']

Verify addition of customer Discount by KAM
    Comment    Login to Vedanta Backend
    Comment    Backend_Dashboard
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Contacts']    ${SHORT_WAIT}    Contacts Heading is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[text()='Contacts']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/contacts/customer_contacts']    ${SHORT_WAIT}    Customer list is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/contacts/customer_contacts']
    SeleniumLibrary.Wait Until Element Is Visible    (//div[@class='panel-heading'])[1]    ${SHORT_WAIT}    Pannel Heading is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='#panel_tab_example2']
    SeleniumLibrary.Input Text    //input[@name='number']    9078631542
    SeleniumLibrary.Click Element    (//button[text()='Search'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //a[@title='Manage Customer Discount']    ${SHORT_WAIT}    Customer Discount tab is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@title='Manage Customer Discount']
    SeleniumLibrary.Wait Until Element Is Visible    //h1[text()='Company Discounts']    ${SHORT_WAIT}    Customer Discount heading is not visible after waiting for${SHORT_WAIT}
    Comment    SeleniumLibrary.Select From List By Label    //span[text()='--All Category--']    Ductile Iron Pipes
    SeleniumLibrary.Click Element    //span[text()='--All Category--']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Ductile Iron Pipes']    ${SHORT_WAIT}    DIP is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[text()='Ductile Iron Pipes']
    Comment    SeleniumLibrary.Select From List By Label    //select[@class='form-control product_list']    All Products
    SeleniumLibrary.Click Element    //select[@class='form-control product_list']
    SeleniumLibrary.Wait Until Element Is Visible    //option[text()=' All Products ']    ${SHORT_WAIT}    Products are not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //option[text()=' All Products ']
    Comment    SeleniumLibrary.Select From List By Label    //span[text()='--All BTP--']    SAP Code: 8500006211, Plot no 8: Sri Hari Gardens Chittoor \ 517001 Andhra Pradesh Chittoor
    SeleniumLibrary.Click Element    //span[text()='--All BTP--']
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Wait Until Element Is Visible    (//span[@class='select2-match'])[2]    ${SHORT_WAIT}    BTP Address is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//span[@class='select2-match'])[2]
    SeleniumLibrary.Input Text    //input[@name='discount_amount']    100
    SeleniumLibrary.Click Element    //input[@class='btn btn-success']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']

Verify Market Corection with out giving valid till date
    Comment    Login to Vedanta Backend
    Comment    Backend_Dashboard
    Comment    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/product_price/market_correction_list/']    ${SHORT_WAIT}    Market correction is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/product_price/market_correction_list/']
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()='Add Market Correction']    ${SHORT_WAIT}    Add Market Correction is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[text()='Add Market Correction']
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='--Select Category--']    ${SHORT_WAIT}    Category is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[text()='--Select Category--']
    SeleniumLibrary.Click Element    //div[text()='TMT']
    SeleniumLibrary.Click Element    //select[@name='dcm_product_master_id']
    SeleniumLibrary.Click Element    //option[text()=' All Products ']
    SeleniumLibrary.Click Element    (//ins[@class='iCheck-helper'])[1]
    SeleniumLibrary.Input Text    //input[@class='form-control']    500
    SeleniumLibrary.Click Element    //input[@class='form-control date-time-picker']
    SeleniumLibrary.Click Element    //input[@class='btn btn-success save_market_correction']
    SeleniumLibrary.Wait Until Element Is Visible    //p[text()='The Valid Till field is required.']    ${SHORT_WAIT}    Error message is not visible after waiting for${SHORT_WAIT}

Verify depot premium
    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/depot_premium/index/']    ${SHORT_WAIT}    Depot Premium is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/depot_premium/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='page-header']    ${SHORT_WAIT}    Depot Premium Header is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\depot_premium_upload_sample_1671125898.xlsx
    SeleniumLibrary.Click Element    //button[@class='btn btn-default']
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\depot_premium_upload_sample_1671125898.xlsx
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    Pricing Navigation
    Approve Pending file
    Freeze Price

Verify the page navigation after clicking on reset button in the transporter page
    SeleniumLibrary.Wait Until Element Is Visible    (//a[@href='javascript:void(0)'])[5]    ${SHORT_WAIT}    LSP is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//a[@href='javascript:void(0)'])[5]
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()='Transporter']    ${SHORT_WAIT}    Transporter is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[text()='Transporter']
    SeleniumLibrary.Wait Until Element Is Visible    //input[@class='form-control']
    SeleniumLibrary.Input Text    //input[@class='form-control']    SRK
    SeleniumLibrary.Click Element    //button[@class='btn btn-default']

Verify Product master
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Products ']    ${SHORT_WAIT}    Products is not visible after waiting for${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //span[text()='Products ']
    SeleniumLibrary.Wait Until Element Is Visible    (//a[@href='javascript:;'])[3]    ${SHORT_WAIT}    Product Master is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//a[@href='javascript:;'])[3]
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/products/list_product_masters']    ${SHORT_WAIT}    List is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/products/list_product_masters']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='products/edit_product/1']    ${SHORT_WAIT}    Edit symbol is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='products/edit_product/1']
    SeleniumLibrary.Wait Until Element Is Visible    //h1[text()='Edit Master Product']    ${SHORT_WAIT}    Header is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    //button[@class='btn btn-primary']
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for${SHORT_WAIT}

Verify \ category Master
    SeleniumLibrary.Wait Until Element Is Visible    (//a[@href='javascript:;'])[2]    ${SHORT_WAIT}    Category master is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//a[@href='javascript:;'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/categories/export_category_catalog/']    ${SHORT_WAIT}    Upload Format is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/categories/export_category_catalog/']
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='-- Select Catalog--']    ${SHORT_WAIT}    Select bar is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[text()='-- Select Catalog--']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='ESL Catalog']    ${SHORT_WAIT}    ESL Catalog is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[text()='ESL Catalog']
    SeleniumLibrary.Click Element    //button[@class='btn btn-default']
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='-- Select Catalog--']    ${SHORT_WAIT}    Select bar is not visible after waiting for${SHORT_WAIT}

Verify Negative functionalities of Freight
    Comment    CustomLibrary.Wait Until Time    5
    Pricing Navigation
    Freeze Price
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/freight/index/']    ${SHORT_WAIT}    Freight is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/freight/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='File']    ${SHORT_WAIT}    File is not visible after waiting ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative_1\\freight_upload_sample_1672806297.xlsx
    SeleniumLibrary.Click Element    //button[text()='Submit']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative\\freight_upload_sample_1672994780.xlsx
    SeleniumLibrary.Click Element    //button[text()='Submit']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    Approve Pending file
    Approve Pending file
    Comment    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Sign in to your account']
    Comment    SeleniumLibrary.Input Text    ${usernameB}    ${test_prerequisite_data}[UsernameB]
    Comment    SeleniumLibrary.Input Text    ${passwordB}    ${test_prerequisite_data}[PasswordB]
    Comment    SeleniumLibrary.Click Button    ${loginB}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${Bdashboard}    ${SHORT_WAIT}    Dashboard Page is not visible after waiting ${SHORT_WAIT}
    Comment    Backend_Dashboard
    Comment    Pricing Navigation
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/freight/index/']    ${SHORT_WAIT}    Freight is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/freight/index/']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='File']    ${SHORT_WAIT}    File is not visible after waiting ${SHORT_WAIT}
    Comment    CustomLibrary.Wait Until Time    15
    Comment    SeleniumLibrary.Click Element    //input[@class='form-control input-sm']
    Comment    SeleniumLibrary.Input Text    //input[@class='form-control input-sm']    122001
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //td[text()='122001']    ${SHORT_WAIT}    Uploaded Freight is not visible after waiting ${SHORT_WAIT}

Verify the \ City wise region discount_Negative
    Comment    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/city_wise_region_discount/index/']    ${SHORT_WAIT}    Citywise Region is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/city_wise_region_discount/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    Col is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative_1\\city_wise_region_discount_upload_sample_1672806306.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    (//button[@class='btn btn-primary'])[1]    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//button[@class='btn btn-primary'])[1]
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative\\city_wise_region_discount_upload_sample_1672994759.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    (//button[@class='btn btn-primary'])[1]    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//button[@class='btn btn-primary'])[1]
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    Approve Pending file
    Approve Pending file
    Comment    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Sign in to your account']
    Comment    Login to Vedanta Backend
    Comment    Backend_Dashboard
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='Products ']    ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //span[text()='Products ']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    (//i[@class="icon-arrow"])[8]    ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    (//i[@class="icon-arrow"])[8]
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/city_wise_region_discount/index/']    ${SHORT_WAIT}    Citywise Region is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/city_wise_region_discount/index/']
    Comment    SeleniumLibrary.Click Element    (//span[text()='---Select---'])[1]
    Comment    SeleniumLibrary.Click Element    //div[text()='TMT']
    Comment    SeleniumLibrary.Click Element    //span[text()='-- Products --']
    Comment    SeleniumLibrary.Click Element    //div[text()='REBAR IS FE500DCRS DIA 10MM-L-12 MTR']
    Comment    SeleniumLibrary.Click Element    //span[text()='-- State --']
    Comment    SeleniumLibrary.Click Element    //div[text()='Telangana']
    Comment    SeleniumLibrary.Click Element    //span[text()='-- City --']
    Comment    SeleniumLibrary.Click Element    //div[text()='Hyderabad']
    Comment    SeleniumLibrary.Click Element    //input[@name='search']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //td[text()='111.00']
    Comment    Screenshot.Take Screenshot

Verify the \ Add on charges_Negative
    SeleniumLibrary.Wait Until Element Is Visible    //a[contains(text(),'Add On')]    ${SHORT_WAIT}    Addon is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[contains(text(),'Add On')]
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()='Addon Pricing']    ${MINI_WAIT}    Addon Pricing is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //a[text()='Addon Pricing']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    File Col is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative_1\\add_on_price_upload_sample_1672806291.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-primary']    ${SHORT_WAIT}    Submit button is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success Message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative\\add_on_price_upload_sample_1672994490.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-primary']    ${SHORT_WAIT}    Submit button is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success Message is not visible after waiting for ${SHORT_WAIT}
    Approve Pending file
    Approve Pending file
    Comment    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Sign in to your account']    ${SHORT_WAIT}    Text is not visible after waiting ${SHORT_WAIT}
    Comment    Login to Vedanta Backend
    Comment    Backend_Dashboard
    Comment    Pricing Navigation
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[contains(text(),'Add On')]    ${SHORT_WAIT}    Addon is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[contains(text(),'Add On')]
    Comment    SeleniumLibrary.Click Element    //a[text()='Addon Pricing']

Verify Basic price upload with negative functionality
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/product_price/upload_category_based_pricing/']    ${SHORT_WAIT}    Category Based Price is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/product_price/upload_category_based_pricing/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    File Col is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative_1\\product_price_upload_sample_1672994787.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@value='Submit']    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@value='Submit']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative\\product_price_upload_sample_1672806301.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@value='Submit']    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@value='Submit']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    Approve Pending file
    Approve Pending file
    Comment    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/sign-out/']    ${SHORT_WAIT}    Signout is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    Comment    Login to Vedanta Backend
    Comment    Backend_Dashboard
    Comment    Pricing Navigation
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/product_price/upload_category_based_pricing/']    ${SHORT_WAIT}    Category Baed Price is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/product_price/upload_category_based_pricing/']

Verify depot Premium_negative
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/depot_premium/index/']    ${SHORT_WAIT}    Depot Premium is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/depot_premium/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='page-header']    ${SHORT_WAIT}    Depot Premium Header is not visible after waiting for${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative_1\\depot_premium_upload_sample_1672806314.xlsx
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative\\depot_premium_upload_sample_1672994771.xlsx
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    Approve Pending file
    Approve Pending file

Verify volume discount upload with negative functionality
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/volume_discount/index/']    ${SHORT_WAIT}    File is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/volume_discount/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    File is not visible after waiting ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    5
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative_1\\volume_discount_upload_sample_1672806312.xlsx
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative\\volume_discount_upload_sample_1672994768.xlsx
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Succes message is not visible after waiting for ${SHORT_WAIT}

Verify financing cost upload with negative functionality
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/financing_cost/index/']    ${SHORT_WAIT}    FinancingCost is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/financing_cost/index/']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='col-md-8']    ${SHORT_WAIT}    Col is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative_1\\financing_cost_upload_sample_1672806309.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@value='Submit']    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@value='Submit']
    SeleniumLibrary.Click Element    //div[@class='col-md-8']
    Upload_File    D:\\Pricing\\Pricing Negative\\financing_cost_upload_sample_1672994763.xlsx
    SeleniumLibrary.Wait Until Element Is Visible    //button[@value='Submit']    ${SHORT_WAIT}    Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@value='Submit']
    Approve Pending file
    Approve Pending file
    SeleniumLibrary.Mouse Over    //span[text()='Sameer Ingole']
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/sign-out/']
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='Sign in to your account']
    SeleniumLibrary.Input Text    ${usernameB}    ${test_prerequisite_data}[UsernameB]
    SeleniumLibrary.Input Text    ${passwordB}    ${test_prerequisite_data}[PasswordB]
    SeleniumLibrary.Click Button    ${loginB}
    SeleniumLibrary.Wait Until Element Is Visible    ${Bdashboard}    ${SHORT_WAIT}    Dashboard Page is not visible after waiting ${SHORT_WAIT}
    Backend_Dashboard
    Pricing Navigation
    SeleniumLibrary.Wait Until Element Is Visible    //a[@href='https://test-managevesale.mjunction.in/pricing/pricing_upload_errors/']    ${SHORT_WAIT}    Dump list is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[@href='https://test-managevesale.mjunction.in/pricing/pricing_upload_errors/']
    SeleniumLibrary.Wait Until Element Is Visible    (//a[text()='Download'])[1]    ${SHORT_WAIT}    Dump list is not visible after waiting ${SHORT_WAIT}
    Screenshot.Take Screenshot
    Pricing Navigation
    Freeze Price

Verify page navigation
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewproductsF}    ${SHORT_WAIT}    Products is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    (//a[@data-pageid='2'])[1]
    SeleniumLibrary.Click Element    (//a[@data-pageid='2'])[1]
    SeleniumLibrary.Wait Until Element Is Visible    //label[text()='Showing 11 – 11 of 11 results']    ${SHORT_WAIT}    Page count is not visible after waiting for ${SHORT_WAIT}

Order Paging Backend
    SeleniumLibrary.Wait Until Element Is Visible    ${OrderslistB}
    SeleniumLibrary.Click Element    ${OrderslistB}
    SeleniumLibrary.Wait Until Element Is Visible    //p[text()='From Date']
    SeleniumLibrary.Scroll Element Into View    //a[text()='Next ']
    SeleniumLibrary.Wait Until Element Is Visible    //a[text()='Next ']    ${SHORT_WAIT}    Next Button is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[text()='Next ']
    SeleniumLibrary.Wait Until Element Is Visible    //p[text()='From Date']
    SeleniumLibrary.Scroll Element Into View    //a[text()='Next ']
    SeleniumLibrary.Click Element    //a[text()='Next ']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Showing 11 to 20 of 10,969 entries']    ${SHORT_WAIT}    Page Count is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[text()='Next ']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Showing 21 to 30 of 10,969 entries']    ${SHORT_WAIT}    Page Count is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //a[text()='Next ']
    SeleniumLibrary.Wait Until Element Is Visible    //div[text()='Showing 31 to 40 of 10,969 entries']    ${SHORT_WAIT}    Page Count is not visible after waiting for ${SHORT_WAIT}

Finacial Number Backend
    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='btn btn-primary btn-sm add-fi-number']
    SeleniumLibrary.Click Element    //a[@class='btn btn-primary btn-sm add-fi-number']
    SeleniumLibrary.Wait Until Element Is Visible    //h4[text()='Add Financial Transaction No.']
    SeleniumLibrary.Input Text    //input[@class='form-control number-valid']    AF51098
    SeleniumLibrary.Click Element    //input[@class='btn btn-success save_fi_number']
    SeleniumLibrary.Wait Until Element Is Visible    //a[@class='btn btn-primary btn-sm add-fi-number']

Verify placing an Order with Expected and P2 Price
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='product-single-details']
    SeleniumLibrary.Input Text    ${quantityF}    500
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Click Element    ${DeliveredDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[2]
    SeleniumLibrary.Wait Until Element Is Visible    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[2]    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[2]
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    //*[@id="shipping-address-box-458"]/div/a
    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="shipping-address-box-458"]/div/a    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    //*[@id="shipping-address-box-458"]/div/a
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${MINI_WAIT}    RFQ list is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQ2}
    SeleniumLibrary.Input Text    //input[@name='suggest_price[]']    ${Expected_Price}
    SeleniumLibrary.Click Element    ${RFQ2}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${AcceptF}
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary btn-sm revise_quote do_revise_quote']
    SeleniumLibrary.Wait Until Element Is Visible    //input[@class='form-control sugg_price_post']
    SeleniumLibrary.Input Text    //input[@class='form-control sugg_price_post']    ${P2_Price}
    SeleniumLibrary.Click Element    //button[@class='btn btn-primary save_revise_quote']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${MINI_WAIT}    Success message is not visible after waiting for ${MINI_WAIT}
    Screenshot.Take Screenshot Without Embedding
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Wait Until Element Is Visible    //span[text()='₹ \ 7,213']    ${MINI_WAIT}    Price is not visible after waiting for ${MINI_WAIT}

Verify Order by placing multiple Products
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='btn btn-block btn-danger']    ${MEDIUM_WAIT}
    Comment    SeleniumLibrary.Scroll Element Into View    //a[text()='REBAR IS 1786 FE500 DIA 20MM-L-12 MTR']
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Input Text    ${quantityF}    150
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${SHORT_WAIT}    Product details Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[text()='Add to Cart']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${SHORT_WAIT}    Success Message is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${SHORT_WAIT}    Product details Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//a[@class='btn-icon btn-add-cart add-to-carts'])[3]
    SeleniumLibrary.Input Text    ${quantityF}    100
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${SHORT_WAIT}    Product details Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //span[text()='Add to Cart']
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${SHORT_WAIT}    Success Message is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${SHORT_WAIT}    Product details Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    (//a[@class='btn-icon btn-add-cart add-to-carts'])[4]
    SeleniumLibrary.Input Text    ${quantityF}    300
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${SHORT_WAIT}    Product details Page is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    Comment    SeleniumLibrary.Click Element    ${LCPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${BGPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${CoPM}
    Comment    Sleep    3
    Comment    SeleniumLibrary.Click Element    ${CreditdaysPM}
    Comment    Sleep    3
    SeleniumLibrary.Click Element    ${DeliveredDT}
    Comment    SeleniumLibrary.Click Element    ${ExwoksDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${SelectSAddress}    ${SHORT_WAIT}    Shipping Address is not visible after waiting for ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    ${SelectSAddress}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${SHORT_WAIT}    Shipping Address is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //*[@id="shipping-address-box-2007"]/div/a    ${SHORT_WAIT}    Billing Address is not visible after waiting for ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    //*[@id="shipping-address-box-2007"]/div/a
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${SHORT_WAIT}    Summary is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${SHORT_WAIT}    Checkout Page is not visible after waiting for ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${SHORT_WAIT}    RFQ list is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ2}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    Comment    ${RFQ Order Success Message}    SeleniumLibrary.Get Text    //div[@class='alert alert-success']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${MINI_SHORT_WAIT}
    Comment    Run Keyword If    " Your RFQ has been successfully submitted. Please await order confirmation via email and notification. " == \ "${RFQ Order Success Message}"    SeleniumLibrary.Close All Browsers
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    Comment    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']
    SeleniumLibrary.Click Element    ${AcceptF}
    SeleniumLibrary.Wait Until Element Is Visible    //button[@class='swal-button swal-button--confirm']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    Screenshot.Take Screenshot Without Embedding
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']

Compare the price in Both Frontend and Backend
    Login to Vedanta Frontend
    SeleniumLibrary.Click Element    ${ProductsF}
    SeleniumLibrary.Click Element    ${TMTF}
    SeleniumLibrary.Click Element    ${Fe500DF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitF}    ${MEDIUM_WAIT}    Image is not visible after waiting ${MEDIUM_WAIT}
    CustomLibrary.Wait Until Time    ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewproductsF}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='product-single-details']
    SeleniumLibrary.Input Text    ${quantityF}    589
    SeleniumLibrary.Wait Until Element Is Visible    ${Addons}    ${MINI_WAIT}    Product details Page is not visible after waiting ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${buynow}
    SeleniumLibrary.Wait Until Element Is Visible    ${AdvancePM}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${AdvancePM}
    SeleniumLibrary.Click Element    ${DeliveredDT}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_ShipAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_ShipAdd}    ${MINI_WAIT}    Shipping Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_ShipAdd}
    SeleniumLibrary.Click Element    ${ShipAF}
    SeleniumLibrary.Wait Until Element Is Visible    ${waitBF}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${BillAF}
    SeleniumLibrary.Scroll Element Into View    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${Staging_BillAdd}    ${MINI_WAIT}    Billing Address is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${Staging_BillAdd}
    SeleniumLibrary.Wait Until Element Is Visible    ${SummaryF}    ${MINI_WAIT}    Summary is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${NextF}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitCheck}    ${MINI_WAIT}    Checkout Page is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Click Element    ${RFQ1}
    SeleniumLibrary.Wait Until Element Is Visible    ${WaitRFQ}    ${MINI_WAIT}    RFQ list is not visible after waiting for ${MINI_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQ2}
    Comment    SeleniumLibrary.Input Text    //input[@name='suggest_price[]']    ${Expected_Price}
    SeleniumLibrary.Click Element    ${RFQ2}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='alert alert-success']    ${SHORT_WAIT}    Success message is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQ}
    SeleniumLibrary.Click Element    ${RFQlist}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQNo}    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQNo}
    SeleniumLibrary.Wait Until Element Is Visible    //h3[text()='RFQ Details']    ${SHORT_WAIT}    RFQ no. is not visible after waiting for ${SHORT_WAIT}
    SeleniumLibrary.Scroll Element Into View    ${AcceptF}
    Comment    SeleniumLibrary.Click Element    //button[@class='btn btn-primary btn-sm revise_quote do_revise_quote']
    Comment    SeleniumLibrary.Wait Until Element Is Visible    //input[@class='form-control sugg_price_post']
    Comment    SeleniumLibrary.Input Text    //input[@class='form-control sugg_price_post']    ${P2_Price}
    Comment    SeleniumLibrary.Click Element    //button[@class='btn btn-primary save_revise_quote']
    SeleniumLibrary.Click Element    ${AcceptF}
    SeleniumLibrary.Wait Until Element Is Visible    //div[@class='swal-icon--success__ring']    ${MINI_WAIT}    Success message is not visible after waiting for ${MINI_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    Screenshot.Take Screenshot Without Embedding
    SeleniumLibrary.Click Element    //button[@class='swal-button swal-button--confirm']
    SeleniumLibrary.Wait Until Element Is Visible    ${FrontPrice}    ${MINI_WAIT}    Price is not visible after waiting for ${MINI_WAIT}
    ${Price_Frontend}    SeleniumLibrary.Get Text    ${FrontPrice}
    ${Price_Frontend}    Convert To String    ${Price_Frontend}
    Login to Vedanta Backend
    Backend_Dashboard
    CustomLibrary.Wait Until Time    ${MEDIUM_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${ManageB}    ${SHORT_WAIT}    Manage is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ManageB}
    CustomLibrary.Wait Until Time    ${MEDIUM_WAIT}
    Comment    SeleniumLibrary.Scroll Element Into View    ${RFQB}
    SeleniumLibrary.Wait Until Element Is Visible    ${RFQB}    ${MEDIUM_WAIT}    RFQ is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${RFQB}
    CustomLibrary.Wait Until Time    ${MEDIUM_WAIT}
    Comment    SeleniumLibrary.Scroll Element Into View    ${SearchRFQ}
    SeleniumLibrary.Wait Until Element Is Visible    ${SearchRFQ}    ${MEDIUM_WAIT}    RFQ list is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${SearchRFQ}
    SeleniumLibrary.Wait Until Element Is Visible    ${ViewRFQ}    ${SHORT_WAIT}    RFQ list is not visible after waiting ${SHORT_WAIT}
    SeleniumLibrary.Click Element    ${ViewRFQ}
    SeleniumLibrary.Wait Until Element Is Visible    //th[text()='Suggested Price/Unit']    ${SHORT_WAIT}    Suggested Price is not visible after waiting ${SHORT_WAIT}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    SeleniumLibrary.Wait Until Element Is Visible    ${suggestedpriceRFQ}    ${SHORT_WAIT}    Suggested Price is not visible after waiting ${SHORT_WAIT}
    Comment    SeleniumLibrary.Click Element    ${suggestedpriceRFQ}
    Comment    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    Comment    ${V1}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[16]
    Comment    ${V2}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[17]
    Comment    ${V3}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[18]
    Comment    ${V4}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[19]
    Comment    ${V5}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[20]
    Comment    ${V6}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[21]
    Comment    ${V7}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[22]
    Comment    ${V8}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[23]
    Comment    ${V9}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[24]
    Comment    ${V10}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[25]
    Comment    ${V11}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[26]
    Comment    ${V12}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[27]
    Comment    ${V13}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[28]
    Comment    ${V14}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[29]
    Comment    ${V15}    SeleniumLibrary.Get Text    (//td[@style='text-align:right;font-family: Courier'])[30]
    Comment    ${Backend_Price}    Evaluate    ${V1}+${V2}+${V3}+${V4}+${V5}+${V6}+${V7}+${V8}+${V9}+${V10}+${V11}+${V12}+${V13}+${V14}+${V15}
    Comment    SeleniumLibrary.Click Element    ${CrossSuggest}
    Comment    ${Backend_Price}    Convert To String    ${Backend_Price}
    ${Backend_Price}    SeleniumLibrary.Get Text    ${BackPrice}
    ${Backend_Price}    Convert To String    ${Backend_Price}
    CustomLibrary.Wait Until Time    ${MINI_WAIT}
    Should Not Be Equal    ${Price_Frontend}    ${Backend_Price}    Both Prices should be equal

Launch_Browser
    [Arguments]    ${URL}    ${Browser_Firefox}
    Selenium2Library.Open Browser    ${URL}    Firefox

Launch Browser1
    [Arguments]    ${URL}    ${browser_name}
    Run Keyword If    '${browser_name}'=='Chrome' or '${browser_name}'=='chrome' or '${browser_name}'=='gc'    Open Chrome Browser    ${URL}
    Run Keyword If    '${browser_name}'== 'Firefox' or '${browser_name}'== 'ff' or '${browser_name}'== 'firefox'    SeleniumLibrary.Open Browser    ${URL}    Firefox

Launch Browser and Navigate to URL
    [Arguments]    ${URL}    ${browser_name}
    Comment    ${session}    Run Keyword And Return Status    SeleniumLibrary.Get Session Id
    Comment    Run Keyword If    ${session}==True    SeleniumLibrary.Go To    ${URL}
    ...    ELSE    Launch Browser1    ${URL}    ${browser_name}
    Comment    SeleniumLibrary.Maximize Browser Window
    Run Keyword If    '${browser_name}'=='Firefox' or '${browser_name}'=='firefox' or '${browser_name}'=='ff'    SeleniumLibrary.Open Browser    ${URL}    Firefox
