wasControlledBy('createAccount','David','owner',1,7).
wasGeneratedBy('bankAccount_David_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('phoneNumber_David_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('mail_David_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('name_David_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('physicalAddress_David_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_David_1', 'createAccount', 'personal data', 7 ).


wasControlledBy('consent','David', 'owner', 8, 9).
wasGeneratedBy('consent_David_1', 'consent', 'consent', 9).

purposes(_,'bankAccount_David_1',['buyItem','askRefund','refund']).
purposes('consent_David_1','phoneNumber_David_1',['sendAdSMS']).
purposes(_,'mail_David_1',['sendMail','sendTicket']).
purposes(_,'name_David_1',['buyItem']).
purposes(_,'physicalAddress_David_1',['buyItem']).
purposes('consent_David_1','id_David_1',['sendImprovementCookie','sendThirdPartiesCookie']).



wasControlledBy('sendTicket','David', 'owner', 10, 13).
used('sendTicket', 'mail_David_1', 'ticket sender mail', 11).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 12).
used('sendTicket', 'ticket', 'ticket sent', 13).


wasControlledBy('askDataAccess','David', 'owner', 14, 15).
wasGeneratedBy('data_request_David', 'askDataAccess', 'request', 15).


wasControlledBy('sendData','DC', 'owner', 1064, 1069).
used('sendData','data_request_David','data request',1065).
wasControlledBy('sendImprovementCookie','DC', 'owner', 1065, 1068).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 1066).
used('sendImprovementCookie','id_David_1', 'user id', 1067).
used('sendImprovementCookie','improvement_cookie', 'cookie', 1068).
wasGeneratedBy('data_report', 'sendData', 'data response', 1069).

wasControlledBy('sendData','David', 'receiver', 1070, 1071).
used('sendData', 'data_report', 'request response received', 1071).

wasControlledBy('updateData','David', 'owner', 36, 38).
used('updateData', 'phoneNumber_Bob_1', 'data to update', 37).
wasGeneratedBy('phoneNumber_Bob_2', 'updateData', 'updated data', 38).

wasControlledBy('buyItem','David', 'owner', 41, 47).
used('buyItem', 'bankAccount_David_1', 'bank account', 42).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 43, 46).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 44).
used('sendThirdPartiesCookie','id_David_1', 'user id', 45).
used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 46).
wasGeneratedBy('receipt', 'buyItem', 'receipt', 47).

wasControlledBy('sendAdSMS','DC', 'owner', 52, 55).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 53).
used('sendAdSMS','phoneNumber_David_2', 'user id', 54).
used('sendAdSMS','ad', 'ad sms', 55).

wasControlledBy('askErase','David', 'owner', 56, 58).
used('askErase', 'phoneNumber_David_2', 'to erase data', 57).
used('askErase', 'bankAccount_David_1', 'to erase data', 58).




wasControlledBy('delete','DC', 'owner', 2060, 2062).
used('delete', 'phoneNumber_David_2', 'erase data', 2061).
used('delete', 'bankAccount_David_1', 'erase data', 2062).

wasControlledBy('updateConsent','David', 'owner', 59, 61).
used('updateConsent', 'consent_David_1', 'consent', 60).
wasGeneratedBy('consent_David_2', 'updateConsent', 'consent', 61).


purposes('consent_David_2','id_David_1',['sendAnalysisCookie','sendImprovementCookie']).

wasControlledBy('sendTicket','DC', 'owner', 3000, 3008).
wasGeneratedBy('ticketReply', 'sendTicket', 'ticket reply', 3001).
used('sendTicket', 'mail_David_1', 'ticket reply sent', 3002).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 3004, 3007).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 3005).
used('sendAnalysisCookie','id_David_1', 'user id', 3006).
used('sendAnalysisCookie','analysis_cookie', 'cookie', 3007).

used('sendTicket', 'ticketReply', 'ticket reply sent', 3008).



wasControlledBy('sendTicket','David', 'owner', 3009, 3010).
used('sendTicket', 'ticketReply', 'ticket reply received', 3010).

wasControlledBy('delete','DC', 'owner', 4000, 4004).
used('delete', 'mail_David_1', 'erase data', 4001).
used('delete', 'name_David_1', 'erase data', 4002).
used('delete', 'physicalAddress_David_1', 'erase data', 4003).
used('delete', 'id_David_1', 'erase data', 4004).


action('sendData', 'sendData').
action('sendThirdPartiesCookie', 'sendThirdPartiesCookie').
action('updateData', 'updateData').
action('sendAdSMS', 'sendAdSMS').
action('sendMail', 'sendMail').
action('sendImprovementCookie', 'sendImprovementCookie').
action('createAccount', 'createAccount').
action('consent', 'consent').
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
purposes(_,_,['consent','delete','askErase','sendData','askDataAccess','updateConsent','updateData','createAccount']).