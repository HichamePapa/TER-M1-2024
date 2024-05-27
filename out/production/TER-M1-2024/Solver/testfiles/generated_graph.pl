wasControlledBy('createAccount','Alice','owner',1,7).
wasGeneratedBy('bankAccount_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('phoneNumber_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('physicalAddress_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 7 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 8, 11).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 9).
used('sendAnalysisCookie','id_Alice_1', 'user id', 10).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 11).

wasControlledBy('consent','Alice','owner', 12, 18).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 13, 17).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 14).
used('sendAnalysisCookie','id_Alice_1', 'user id', 15).
used('sendAnalysisCookie', 'bankAccount_Alice_1', 'extra data', 16).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 17).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 18).

purposes(_,'bankAccount_Alice_1',['buyItem','askRefund','refund']).
purposes('consent_Alice_1','phoneNumber_Alice_1',['refund']).
purposes(_,'mail_Alice_1',['sendMail','sendTicket']).
purposes(_,'name_Alice_1',['buyItem']).
purposes(_,'physicalAddress_Alice_1',['buyItem']).
purposes('consent_Alice_1','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie']).

used('revokeConsent','consent_Alice_1','revokeConsent', 19).

wasControlledBy('updateConsent','Alice', 'owner', 20, 22).
used('updateConsent', 'consent_Alice_1', 'consent', 21).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 22).


purposes('consent_Alice_2','phoneNumber_Alice_1',['buyItem','refund']).
purposes('consent_Alice_2','id_Alice_1',['sendAnalysisCookie']).



wasControlledBy('buyItem','Alice', 'owner', 23, 35).
used('buyItem','bankAccount_Alice_1', 'bank account', 24).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 25, 29).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 26).
used('sendThirdPartiesCookie','id_Alice_1', 'user id', 27).
used('sendThirdPartiesCookie', 'bankAccount_Alice_1', 'extra data', 28).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 29).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 30, 34).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 31).
used('sendPersonalizationCookie','id_Alice_1', 'user id', 32).
used('sendPersonalizationCookie', 'physicalAddress_Alice_1', 'extra data', 33).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 34).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 35).




wasControlledBy('updateData','Alice', 'owner', 36, 38).
used('updateData','id_Alice_1', 'data to update', 37).
wasGeneratedBy('id_Alice_2', 'updateData', 'updated data', 38).

wasControlledBy('sendAdSMS','DC', 'owner', 39, 42).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 40).
used('sendAdSMS','phoneNumber_Alice_1', 'user phone number', 41).
used('sendAdSMS','ad', 'ad sms', 42).

wasControlledBy('buyItem','Alice', 'owner', 43, 45).
used('buyItem','bankAccount_Alice_1', 'bank account', 44).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 45).
wasControlledBy('sendMail','DC', 'owner', 46, 54).
wasGeneratedBy('message','sendMail', 'mail to send', 47).
used('sendMail','mail_Alice_1', 'address to send to', 48).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 49, 53).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 50).
used('sendAnalysisCookie','id_Alice_2', 'user id', 51).
used('sendAnalysisCookie', 'physicalAddress_Alice_1', 'extra data', 52).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 53).

used('sendMail', 'message', 'mail sent', 54).
wasControlledBy('sendTicket','Alice', 'owner', 55, 58).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 56).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 57).
used('sendTicket', 'ticket', 'ticket sent', 58).



wasControlledBy('sendTicket','DC', 'owner', 75278, 75281).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 75279).
used('sendTicket','mail_Alice_1', 'ticket reply sent', 75280).
used('sendTicket','ticketReply', 'ticket reply sent', 75281).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 23406, 23410).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 23407).
used('sendAnalysisCookie','id_Alice_2', 'user id', 23408).
used('sendAnalysisCookie', 'physicalAddress_Alice_1', 'extra data', 23409).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 23410).

wasControlledBy('sendImprovementCookie','DC', 'owner', 63453, 63456).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 63454).
used('sendImprovementCookie','id_Alice_2', 'user id', 63455).

used('sendImprovementCookie','improvement_cookie', 'cookie', 63456).

wasControlledBy('sendTicket','Alice', 'owner', 63457, 63458).
used('sendTicket', 'ticketReply', 'ticket reply received', 63458).

wasControlledBy('askRefund','Alice', 'owner', 59, 65).
wasControlledBy('sendImprovementCookie','DC', 'owner', 60, 64).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 61).
used('sendImprovementCookie','id_Alice_2', 'user id', 62).
used('sendImprovementCookie', 'mail_Alice_1', 'extra data', 63).

used('sendImprovementCookie','improvement_cookie', 'cookie', 64).

used('askRefund', 'receipt', 'bank account', 65).

wasControlledBy('refund','DC', 'owner', 56336, 56338).
used('refund', 'bankAccount_Alice_1', 'extra data', 56337).

used('refund', 'bankAccount_Alice_1', 'bank account', 56338).
wasControlledBy('askDataAccess','Alice','owner', 66, 71).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 67, 70).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 68).
used('sendAnalysisCookie','id_Alice_2', 'user id', 69).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 70).

wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 71).

wasControlledBy('sendData','DC', 'owner', 32095, 32096).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 32096).

wasControlledBy('sendData','Alice', 'receiver', 32097, 32098).
used('sendData', 'data_report', 'request response received', 32098).
wasControlledBy('createAccount','Bob','owner',1,7).
wasGeneratedBy('bankAccount_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('phoneNumber_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('physicalAddress_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 7 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 8, 11).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 9).
used('sendAnalysisCookie','id_Bob_1', 'user id', 10).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 11).




wasControlledBy('updateData','Bob', 'owner', 12, 14).
used('updateData','name_Bob_1', 'data to update', 13).
wasGeneratedBy('name_Bob_2', 'updateData', 'updated data', 14).

wasControlledBy('consent','Bob','owner', 15, 20).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 16, 19).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 17).
used('sendAnalysisCookie','id_Bob_1', 'user id', 18).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 19).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 20).

purposes(_,'bankAccount_Bob_1',['buyItem','askRefund','refund']).
purposes('consent_Bob_1','phoneNumber_Bob_1',['buyItem','refund']).
purposes(_,'mail_Bob_1',['sendMail','sendTicket']).
purposes(_,'name_Bob_2',['buyItem']).
purposes(_,'physicalAddress_Bob_1',['buyItem']).
purposes('consent_Bob_1','id_Bob_1',['sendAnalysisCookie']).

wasControlledBy('updateConsent','Bob', 'owner', 21, 23).
used('updateConsent', 'consent_Bob_1', 'consent', 22).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 23).


purposes('consent_Bob_2','phoneNumber_Bob_1',['buyItem']).
purposes('consent_Bob_2','id_Bob_1',['sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).





wasControlledBy('updateData','Bob', 'owner', 24, 26).
used('updateData','name_Bob_2', 'data to update', 25).
wasGeneratedBy('name_Bob_3', 'updateData', 'updated data', 26).


wasControlledBy('updateConsent','Bob', 'owner', 27, 29).
used('updateConsent', 'consent_Bob_2', 'consent', 28).
wasGeneratedBy('consent_Bob_3', 'updateConsent', 'consent', 29).


purposes('consent_Bob_3','phoneNumber_Bob_1',['buyItem','refund']).
purposes('consent_Bob_3','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).



wasControlledBy('buyItem','Bob', 'owner', 30, 32).
used('buyItem','bankAccount_Bob_1', 'bank account', 31).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 32).

wasControlledBy('askRefund','Bob', 'owner', 33, 39).
wasControlledBy('sendImprovementCookie','DC', 'owner', 34, 38).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 35).
used('sendImprovementCookie','id_Bob_1', 'user id', 36).
used('sendImprovementCookie', 'name_Bob_3', 'extra data', 37).

used('sendImprovementCookie','improvement_cookie', 'cookie', 38).

used('askRefund', 'receipt', 'bank account', 39).

wasControlledBy('refund','DC', 'owner', 50665, 50666).

used('refund', 'bankAccount_Bob_1', 'bank account', 50666).


wasControlledBy('sendMail','DC', 'owner', 40, 47).
wasGeneratedBy('message','sendMail', 'mail to send', 41).
used('sendMail','mail_Bob_1', 'address to send to', 42).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 43, 46).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 44).
used('sendAnalysisCookie','id_Bob_1', 'user id', 45).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 46).

used('sendMail', 'message', 'mail sent', 47).

used('revokeConsent','consent_Bob_3','revokeConsent', 48).
wasControlledBy('askDataAccess','Bob','owner', 49, 50).


wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 50).

wasControlledBy('sendData','DC', 'owner', 58828, 58829).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 58829).

wasControlledBy('sendData','Bob', 'receiver', 58830, 58831).
used('sendData', 'data_report', 'request response received', 58831).
wasControlledBy('askErase','Bob', 'owner', 51, 57).
used('askErase','bankAccount_Bob_1', 'to erase data', 52).
used('askErase','phoneNumber_Bob_1', 'to erase data', 53).
used('askErase','mail_Bob_1', 'to erase data', 54).
used('askErase','name_Bob_3', 'to erase data', 55).
used('askErase','physicalAddress_Bob_1', 'to erase data', 56).
used('askErase','id_Bob_1', 'to erase data', 57).



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
