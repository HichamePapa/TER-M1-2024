wasControlledBy('createAccount','Alice','owner',1,2).
wasGeneratedBy('phoneNumber_Alice_1','createAccount','personal data', 2 ).

wasControlledBy('consent','Alice','owner',3, 4).
wasGeneratedBy('consent_Alice_1','consent','consent', 4).

purposes('consent_Alice_1','phoneNumber_Alice_1',['sendAdSMS']).

wasControlledBy('askErase','Alice','owner', 26, 28).
used('askErase','phoneNumber_Alice_1','to erase data', 27).


wasControlledBy('createAccount','Bob','owner',1,2).
wasGeneratedBy('phoneNumber_Bob_1','createAccount','personal data', 2 ).

wasControlledBy('consent','Bob','owner',3, 4).
wasGeneratedBy('consent_Bob_1','consent','consent', 4).

purposes('consent_Bob_1','phoneNumber_Bob_1',['']).

wasControlledBy('askErase','Bob','owner', 36, 37).
used('askErase','phoneNumber_Bob_1','to erase data', 37).

wasControlledBy('delete','DC','owner', 2060, 2062).
used('delete','phoneNumber_Bob_1','erase data', 2061).


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