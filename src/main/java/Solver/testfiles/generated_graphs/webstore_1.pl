wasControlledBy('createAccount','Alice','owner',1,7).
wasGeneratedBy('bankAccount_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('address_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('phoneNumber_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 7 ).



wasControlledBy('askDataAccess','Alice','owner', 8, 9).


wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 9).

wasControlledBy('sendData','DC', 'owner', 61387, 61389).
used('sendData', 'data_request_Alice', 'request received', 61388).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 61389).

wasControlledBy('sendData','Alice', 'receiver', 61390, 61391).
used('sendData', 'data_report_Alice', 'request response received', 61391).
wasControlledBy('sendAdSMS','DC', 'owner', 10, 13).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 11).
used('sendAdSMS','phoneNumber_Alice_1', 'user phone number', 12).
used('sendAdSMS','ad', 'ad sms', 13).
wasControlledBy('consent','Alice','owner', 14, 15).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 15).

purposes(_,'bankAccount_Alice_1',['buyItem','askRefund','refund']).
purposes(_,'address_Alice_1',['buyItem']).
purposes('consent_Alice_1','phoneNumber_Alice_1',[]).
purposes(_,'mail_Alice_1',['sendMail','sendTicket']).
purposes(_,'name_Alice_1',['buyItem']).
purposes('consent_Alice_1','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie']).


wasControlledBy('updateConsent','Alice', 'owner', 16, 18).
used('updateConsent', 'consent_Alice_1', 'consent', 17).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 18).


purposes('consent_Alice_2','phoneNumber_Alice_1',['sendAdSMS','buyItem','refund']).
purposes('consent_Alice_2','id_Alice_1',['sendThirdPartiesCookie','sendImprovementCookie']).



wasControlledBy('buyItem','Alice', 'owner', 19, 21).
used('buyItem','bankAccount_Alice_1', 'bank account', 20).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 21).




wasControlledBy('updateData','Alice', 'owner', 22, 24).
used('updateData','address_Alice_1', 'data to update', 23).
wasGeneratedBy('address_Alice_2', 'updateData', 'updated data', 24).


wasControlledBy('updateConsent','Alice', 'owner', 25, 27).
used('updateConsent', 'consent_Alice_2', 'consent', 26).
wasGeneratedBy('consent_Alice_3', 'updateConsent', 'consent', 27).


purposes('consent_Alice_3','phoneNumber_Alice_1',['sendAdSMS','buyItem']).
purposes('consent_Alice_3','id_Alice_1',['sendAnalysisCookie','sendImprovementCookie']).



wasControlledBy('buyItem','Alice', 'owner', 28, 34).
used('buyItem','bankAccount_Alice_1', 'bank account', 29).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 30, 33).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 31).
used('sendPersonalizationCookie','id_Alice_1', 'user id', 32).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 33).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 34).


used('revokeConsent','consent_Alice_3','revokeConsent', 35).
wasControlledBy('sendMail','DC', 'owner', 36, 39).
wasGeneratedBy('message','sendMail', 'mail to send', 37).
used('sendMail','mail_Alice_1', 'address to send to', 38).

used('sendMail', 'message', 'mail sent', 39).
wasControlledBy('sendAdSMS','DC', 'owner', 40, 43).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 41).
used('sendAdSMS','phoneNumber_Alice_1', 'user phone number', 42).
used('sendAdSMS','ad', 'ad sms', 43).
wasControlledBy('sendTicket','Alice', 'owner', 44, 47).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 45).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 46).
used('sendTicket', 'ticket', 'ticket sent', 47).



wasControlledBy('sendTicket','DC', 'owner', 40988, 40991).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 40989).
used('sendTicket','mail_Alice_1', 'ticket reply sent', 40990).
used('sendTicket','ticketReply', 'ticket reply sent', 40991).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 109427, 109430).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 109428).
used('sendAnalysisCookie','id_Alice_1', 'user id', 109429).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 109430).


wasControlledBy('sendTicket','Alice', 'owner', 109431, 109432).
used('sendTicket', 'ticketReply', 'ticket reply received', 109432).
wasControlledBy('createAccount','Bob','owner',1,7).
wasGeneratedBy('bankAccount_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('address_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('phoneNumber_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 7 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 8, 11).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 9).
used('sendAnalysisCookie','id_Bob_1', 'user id', 10).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 11).


wasControlledBy('consent','Bob','owner', 12, 17).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 13, 16).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 14).
used('sendAnalysisCookie','id_Bob_1', 'user id', 15).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 16).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 17).

purposes(_,'bankAccount_Bob_1',['buyItem','askRefund','refund']).
purposes(_,'address_Bob_1',['buyItem']).
purposes('consent_Bob_1','phoneNumber_Bob_1',['sendAdSMS','buyItem']).
purposes(_,'mail_Bob_1',['sendMail','sendTicket']).
purposes(_,'name_Bob_1',['buyItem']).
purposes('consent_Bob_1','id_Bob_1',['sendAnalysisCookie','sendImprovementCookie']).


used('revokeConsent','consent_Bob_1','revokeConsent', 18).
wasControlledBy('askDataAccess','Bob','owner', 19, 20).


wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 20).

wasControlledBy('sendData','DC', 'owner', 51653, 51655).
used('sendData', 'data_request_Bob', 'request received', 51654).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 51655).

wasControlledBy('sendData','Bob', 'receiver', 51656, 51657).
used('sendData', 'data_report_Bob', 'request response received', 51657).

wasControlledBy('updateConsent','Bob', 'owner', 21, 23).
used('updateConsent', 'consent_Bob_1', 'consent', 22).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 23).


purposes('consent_Bob_2','phoneNumber_Bob_1',['sendAdSMS','refund']).
purposes('consent_Bob_2','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendPersonalizationCookie']).



wasControlledBy('buyItem','Bob', 'owner', 24, 30).
used('buyItem','bankAccount_Bob_1', 'bank account', 25).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 26, 29).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 27).
used('sendThirdPartiesCookie','id_Bob_1', 'user id', 28).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 29).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 30).

wasControlledBy('askRefund','Bob', 'owner', 31, 32).

used('askRefund', 'receipt', 'bank account', 32).

wasControlledBy('refund','DC', 'owner', 71926, 71928).
used('refund', 'name_Bob_1', 'extra data', 71927).

used('refund', 'bankAccount_Bob_1', 'bank account', 71928).

wasControlledBy('sendTicket','Bob', 'owner', 33, 36).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 34).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 35).
used('sendTicket', 'ticket', 'ticket sent', 36).



wasControlledBy('sendTicket','DC', 'owner', 87740, 87743).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 87741).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 87742).
used('sendTicket','ticketReply', 'ticket reply sent', 87743).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 40159, 40163).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 40160).
used('sendAnalysisCookie','id_Bob_1', 'user id', 40161).
used('sendAnalysisCookie', 'name_Bob_1', 'extra data', 40162).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 40163).


wasControlledBy('sendTicket','Bob', 'owner', 40164, 40165).
used('sendTicket', 'ticketReply', 'ticket reply received', 40165).



wasControlledBy('updateData','Bob', 'owner', 37, 39).
used('updateData','phoneNumber_Bob_1', 'data to update', 38).
wasGeneratedBy('phoneNumber_Bob_2', 'updateData', 'updated data', 39).


wasControlledBy('buyItem','Bob', 'owner', 40, 42).
used('buyItem','bankAccount_Bob_1', 'bank account', 41).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 42).
wasControlledBy('sendMail','DC', 'owner', 43, 46).
wasGeneratedBy('message','sendMail', 'mail to send', 44).
used('sendMail','mail_Bob_1', 'address to send to', 45).

used('sendMail', 'message', 'mail sent', 46).
wasControlledBy('askErase','Bob', 'owner', 47, 53).
used('askErase','bankAccount_Bob_1', 'to erase data', 48).
used('askErase','address_Bob_1', 'to erase data', 49).
used('askErase','phoneNumber_Bob_2', 'to erase data', 50).
used('askErase','mail_Bob_1', 'to erase data', 51).
used('askErase','name_Bob_1', 'to erase data', 52).
used('askErase','id_Bob_1', 'to erase data', 53).



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
