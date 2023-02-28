*** Variables ***
${AdvancePM}      //input[@name='payment_method' and \ @value='advance']
${LCPM}           //input[@name='payment_method' and \ @value='lc']
${BGPM}           //input[@name='payment_method' and \ @value='bg']
${CoPM}           //input[@name='payment_method' and \ @value='coface']
${CreditdaysPM}    //input[@name='payment_method' and \ @value='creditdays']
${DeliveredDT}    //input[@id='deliveryType' and \ @value='1']
${ExwoksDT}       //input[@id='deliveryType' and \ @value='2']
${Address1}       (//input[@class='square-black'])[1]
${Address2}       (//input[@class='square-black'])[2]
${AdvanceB}       (//ins[@class='iCheck-helper'])[1]
${DeliveredB}     (//ins[@class='iCheck-helper'])[6]