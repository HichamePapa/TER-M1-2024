wasControlledBy('createAccount','David','owner',1,2).
wasGeneratedBy('phoneNumber_David_1','createAccount','personal data', 2 ).



wasControlledBy('consent','David','owner',3, 4).
wasGeneratedBy('consent_David_1','consent','consent', 4).

purposes('consent_David_1','phoneNumber_David_1',['sendAdSMS']).

wasControlledBy('sendAdSMS','DC','owner', 22, 25).
wasGeneratedBy('ad','sendAdSMS','ad to send', 23).
used('sendAdSMS','phoneNumber_David_1','user phone number', 24).
used('sendAdSMS','ad','ad sms', 25).

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