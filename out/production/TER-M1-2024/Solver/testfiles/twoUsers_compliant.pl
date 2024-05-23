wasControlledBy('createAccount','Alice','owner',1,2).
wasGeneratedBy('phoneNumber_Alice_1','createAccount','personal data', 2 ).



wasControlledBy('consent','Alice','owner',3, 4).
wasGeneratedBy('consent_Alice_1','consent','consent', 4).

purposes('consent_Alice_1','phoneNumber_Alice_1',['sendAdSMS']).

wasControlledBy('sendAdSMS','DC','owner', 22, 25).
wasGeneratedBy('ad','sendAdSMS','ad to send', 23).
used('sendAdSMS','phoneNumber_Alice_1','user phone number', 24).
used('sendAdSMS','ad','ad sms', 25).


wasControlledBy('createAccount','Bob','owner',1,2).
wasGeneratedBy('phoneNumber_Bob_1','createAccount','personal data', 2 ).

wasControlledBy('consent','Bob','owner',3, 4).
wasGeneratedBy('consent_Bob_1','consent','consent', 4).

purposes('consent_Bob_1','phoneNumber_Bob_1',['buyItem']).

wasControlledBy('buyItem','Bob','owner', 41, 44).
used('buyItem','bankAccount_Bob_1','bank account', 42).
used('buyItem','phoneNumber_Bob_1','phone number', 43).
wasGeneratedBy('receipt','buyItem','receipt', 44).


action('sendData', 'sendData').
action('sendThirdPartiesCookie', 'sendThirdPartiesCookie').
action('updateData', 'updateData').
action('sendAdSMS', 'sendAdSMS').
action('sendMail', 'sendMail').
action('sendImprovementCookie', 'sendImprovementCookie').
action('createAccount', 'createAccount').
action('consent', 'consent').
action('login', 'login').
action('buyItem', 'buyItem').
action('delete', 'delete').
action('askDataAccess', 'askDataAccess').
action('askRefund', 'askRefund').
action('sendTicket', 'sendTicket').
action('sendPersonalizationCookie', 'sendPersonalizationCookie').
action('sendAnalysisCookie', 'sendAnalysisCookie').
action('providePolicy', 'providePolicy').
action('askErase', 'askErase').
action('updateConsent', 'updateConsent').
action('refund', 'refund').
purposes(_,_,['consent','delete','askErase','sendData','askDataAccess','updateConsent','accessWebPage','updateData','createAccount','login']).