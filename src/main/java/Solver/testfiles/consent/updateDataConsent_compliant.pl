wasControlledBy('createAccount','David','owner',1,2).
wasGeneratedBy('phoneNumber_David_1','createAccount','personal data', 2 ).



wasControlledBy('consent','David','owner',3, 4).
wasGeneratedBy('consent_David_1','consent','consent', 4).

purposes('consent_David_1','phoneNumber_David_1',['']).

wasControlledBy('updateData','David','owner', 36, 38).
used('updateData','phoneNumber_David_1','data to update', 37).
wasGeneratedBy('phoneNumber_David_2','updateData','updated data', 38).


wasControlledBy('updateConsent','David','owner', 39, 41).
used('updateConsent','consent_David_1','consent', 40).
wasGeneratedBy('consent_David_2','updateConsent','consent', 41).

purposes('consent_David_2','phoneNumber_David_2',['sendAdSMS']).

wasControlledBy('sendAdSMS','DC','owner', 49, 52).
wasGeneratedBy('ad','sendAdSMS','ad to send', 50).
used('sendAdSMS','phoneNumber_David_2','user phone number', 51).
used('sendAdSMS','ad','ad sms', 52).

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