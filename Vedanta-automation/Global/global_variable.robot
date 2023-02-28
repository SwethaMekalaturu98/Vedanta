*** Variables ***
${URL}            https://test-vesale.mjunction.in/
${browser}        Chrome
${TESTDATA_FOLDER}    ${EXECDIR}/TestData
${Login}          //a[text()='LOG IN']
${loginpage}      //h2[text()='Existing Customer Login']
${Filepath}       D:\\Vedanta_Automation\\Vedanta-automation\\TestData\\Testdata.xls
${Bdashboard}     //h2[text()='Pending Approvals']
${mouseoverB}     (//a[@class='dropdown-toggle'])[2]
${ProductsF}      (//a[text()='Products'])[1]
${TMTF}           (//a[text()='TMT'])[1]
${Fe500DF}        (//a[text()='Fe500D'])[1]
${waitF}          //h4[text()='TMT (Fe500D)']
${ViewproductsF}    //*[@id="list_products"]/div[1]/div/h2/a
${ShipAF}         //a[@href='#shipping-address-section']
${SelectSAddress}    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[1]
${BillAF}         (//i[@class='fas fa-angle-down rotate-icon'])[2]
${SelectBaddress}    //*[@id="shipping-address-box-2007"]/div/a
${WaitCheck}      (//h3[@class='step-title'])[1]
${RFQ}            (//a[text()='RFQ'])[1]
${RFQlist}        (//a[text()='Requested Quotations'])[1]
${WaitPVF}        //a[text()='REBAR IS 1786 FE500 DIA 20MM-L-12 MTR']
${SummaryF}       //h3[text()='Summary']
${waitBF}         //a[@href='#billing-address-section']
${WaitRFQ}        //h4[text()='Your Shipping Address:']
${RFQNo}          //*[@id="dt-opt"]/tbody/tr[1]/td[2]/div/div/div/span[1]/a
${PriceCalculator}    //a[@href='https://test-managevesale.mjunction.in/pricing/price_calculator/']
${SearchClient}    //input[@id='phone_gst']
${Categoery1B}    //div[@class='select2-result-label' and text()='TMT']
${Waitcategory}    (//div[@class='col-sm-4'])[5]
${SelectsubC}     //select[@name='sub_category_id']
${Addons}         //label[text()=' Addons ']
${WaitDep}        //a[@href='https://test-managevesale.mjunction.in/depot_premium/index/']
${SuggestedPB}    //a[@class='suggested_price number']
${WaitPC}         //td[text()='REBAR IS 1786 FE500 DIA 32MM-L-12 MTR']
${ManageB}        //span[text()='Manage']
${RFQB}           //span[text()='RFQ']
${SearchRFQ}      //a[text()=' Search ']
${suggestedpriceRFQ}    //a[@class='suggested_price number']
${OrdersB}        //span[@class='title' and text()='Orders']
${OrderslistB}    //a[text()=' Order List ']
${VieworderB}     (//i[@class='fa fa-eye'])[1]
${waitorder}      //h4[text()='Order Info:']
${CrossSuggest}    //span[text()='×']
${CheckboxSpot}    //input[@name='tmc_accepted']
${Suggestlinkspot}    //a[@class='suggested_price number']
${DIP}            (//a[text()='Ductile Iron Pipes'])[1]
${ClassK7}        (//a[@href='https://test-vesale.mjunction.in/product/catalogs/DuctileIronPipes/ClassK7'])[1]
${WaitDIP}        //h4[text()='Ductile Iron Pipes (Class K7)']
${DIPProF}        (//a[@href='/product/details/DI1000DNK7SOCKETandSPIGOTPIPE'])[2]
${WaitDIP1}       //h1[text()='DI 1000DN K7 SOCKET & SPIGOT PIPE']
${QuantityDIP}    //input[@id='prod_quantity']
${OrdervalidityDIP}    //input[@max='2023-12-31']
${CheckoutDIP}    //th[text()='Addons']
${SHORT_WAIT}     5
${MINI_WAIT}      2
${MEDIUM_WAIT}    10
${LONG_WAIT}      20
${Discount}       100
${REGISTER}       //a[text()='REGISTER']
${Wait1R}         //h2[text()='New Customer? Register Here']
${Register_mobile}    //input[@id='register-mobile']
${Register_Company}    //input[@id='register-company-gst']
${Captcha}        //input[@id='captcha']
${Wait2R}         //label[@for='OTP']
${Grand total}    (//td[@align='right'])[4]
${Quoted_PriceF}    7513
${Expected_Price}    7033
${P2_Price}       7213
${FrontPrice}     (//span[@class='badge badge-primary'])[3]
${BackPrice}      //a[@class='suggested_price number']
${Browser_Name}    Firefox
${Staging_ShipAdd}    (//a[@class='btn btn-sm btn-outline-secondary float-right bill_here'])[1]
${Staging_BillAdd}    //*[@id="shipping-address-box-2007"]/div/a
