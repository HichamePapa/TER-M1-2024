wasControlledBy('createAccount','Alice','owner',1,7).
wasGeneratedBy('bankAccount_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('address_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('phoneNumber_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 7 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 8, 11).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 9).
used('sendAnalysisCookie','id_Alice_1', 'user id', 10).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 11).

wasControlledBy('consent','Alice','owner', 12, 13).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 13).

purposes(_,'bankAccount_Alice_1',['buyItem','askRefund','refund']).
purposes(_,'address_Alice_1',['buyItem']).
purposes('consent_Alice_1','phoneNumber_Alice_1',['refund']).
purposes(_,'mail_Alice_1',['sendMail','sendTicket']).
purposes(_,'name_Alice_1',['buyItem']).
purposes('consent_Alice_1','id_Alice_1',[]).





wasControlledBy('updateData','Alice', 'owner', 14, 16).
used('updateData','phoneNumber_Alice_1', 'data to update', 15).
wasGeneratedBy('phoneNumber_Alice_2', 'updateData', 'updated data', 16).


wasControlledBy('updateConsent','Alice', 'owner', 17, 19).
used('updateConsent', 'consent_Alice_1', 'consent', 18).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 19).


purposes('consent_Alice_2','phoneNumber_Alice_2',['sendAdSMS','buyItem','refund']).
purposes('consent_Alice_2','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).





wasControlledBy('updateData','Alice', 'owner', 20, 22).
used('updateData','phoneNumber_Alice_2', 'data to update', 21).
wasGeneratedBy('phoneNumber_Alice_3', 'updateData', 'updated data', 22).


wasControlledBy('updateConsent','Alice', 'owner', 23, 25).
used('updateConsent', 'consent_Alice_2', 'consent', 24).
wasGeneratedBy('consent_Alice_3', 'updateConsent', 'consent', 25).


purposes('consent_Alice_3','phoneNumber_Alice_3',['sendAdSMS','buyItem']).
purposes('consent_Alice_3','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendPersonalizationCookie']).



wasControlledBy('buyItem','Alice', 'owner', 26, 37).
used('buyItem','bankAccount_Alice_1', 'bank account', 27).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 28, 31).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 29).
used('sendThirdPartiesCookie','id_Alice_1', 'user id', 30).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 31).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 32, 36).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 33).
used('sendPersonalizationCookie','id_Alice_1', 'user id', 34).
used('sendPersonalizationCookie', 'address_Alice_1', 'extra data', 35).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 36).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 37).


wasControlledBy('sendTicket','Alice', 'owner', 38, 41).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 39).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 40).
used('sendTicket', 'ticket', 'ticket sent', 41).





wasControlledBy('updateData','Alice', 'owner', 42, 44).
used('updateData','phoneNumber_Alice_3', 'data to update', 43).
wasGeneratedBy('phoneNumber_Alice_4', 'updateData', 'updated data', 44).


wasControlledBy('updateConsent','Alice', 'owner', 45, 47).
used('updateConsent', 'consent_Alice_3', 'consent', 46).
wasGeneratedBy('consent_Alice_4', 'updateConsent', 'consent', 47).


purposes('consent_Alice_4','phoneNumber_Alice_4',['buyItem']).
purposes('consent_Alice_4','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie']).



wasControlledBy('buyItem','Alice', 'owner', 48, 50).
used('buyItem','bankAccount_Alice_1', 'bank account', 49).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 50).

wasControlledBy('askDataAccess','Alice','owner', 51, 56).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 52, 55).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 53).
used('sendAnalysisCookie','id_Alice_1', 'user id', 54).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 55).

wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 56).

wasControlledBy('sendData','DC', 'owner', 49928, 49930).
used('sendData', 'data_request_Alice', 'request received', 49929).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 49930).

wasControlledBy('sendData','Alice', 'receiver', 49931, 49932).
used('sendData', 'data_report_Alice', 'request response received', 49932).
wasControlledBy('sendMail','DC', 'owner', 57, 65).
wasGeneratedBy('message','sendMail', 'mail to send', 58).
used('sendMail','mail_Alice_1', 'address to send to', 59).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 60, 64).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 61).
used('sendAnalysisCookie','id_Alice_1', 'user id', 62).
used('sendAnalysisCookie', 'name_Alice_1', 'extra data', 63).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 64).

used('sendMail', 'message', 'mail sent', 65).

wasControlledBy('sendTicket','DC', 'owner', 124955, 124958).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 124956).
used('sendTicket','mail_Alice_1', 'ticket reply sent', 124957).
used('sendTicket','ticketReply', 'ticket reply sent', 124958).


wasControlledBy('sendTicket','Alice', 'owner', 124959, 124960).
used('sendTicket', 'ticketReply', 'ticket reply received', 124960).



wasControlledBy('updateData','Alice', 'owner', 66, 68).
used('updateData','name_Alice_1', 'data to update', 67).
wasGeneratedBy('name_Alice_2', 'updateData', 'updated data', 68).


wasControlledBy('buyItem','Alice', 'owner', 69, 80).
used('buyItem','bankAccount_Alice_1', 'bank account', 70).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 71, 74).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 72).
used('sendThirdPartiesCookie','id_Alice_1', 'user id', 73).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 74).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 75, 79).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 76).
used('sendPersonalizationCookie','id_Alice_1', 'user id', 77).
used('sendPersonalizationCookie', 'mail_Alice_1', 'extra data', 78).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 79).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 80).
wasControlledBy('createAccount','Bob','owner',1,7).
wasGeneratedBy('bankAccount_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('address_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('phoneNumber_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 7 ).


wasControlledBy('consent','Bob','owner', 8, 9).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 9).

purposes(_,'bankAccount_Bob_1',['buyItem','askRefund','refund']).
purposes(_,'address_Bob_1',['buyItem']).
purposes('consent_Bob_1','phoneNumber_Bob_1',['buyItem']).
purposes(_,'mail_Bob_1',['sendMail','sendTicket']).
purposes(_,'name_Bob_1',['buyItem']).
purposes('consent_Bob_1','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie']).


wasControlledBy('sendTicket','Bob', 'owner', 10, 14).
used('sendTicket', 'name_Bob_1', 'extra data', 11).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 12).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 13).
used('sendTicket', 'ticket', 'ticket sent', 14).



wasControlledBy('sendTicket','DC', 'owner', 71784, 71787).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 71785).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 71786).
used('sendTicket','ticketReply', 'ticket reply sent', 71787).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 107141, 107144).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 107142).
used('sendAnalysisCookie','id_Bob_1', 'user id', 107143).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 107144).

wasControlledBy('sendImprovementCookie','DC', 'owner', 77452, 77456).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 77453).
used('sendImprovementCookie','id_Bob_1', 'user id', 77454).
used('sendImprovementCookie', 'phoneNumber_Bob_1', 'extra data', 77455).

used('sendImprovementCookie','improvement_cookie', 'cookie', 77456).

wasControlledBy('sendTicket','Bob', 'owner', 77457, 77458).
used('sendTicket', 'ticketReply', 'ticket reply received', 77458).



wasControlledBy('updateData','Bob', 'owner', 15, 17).
used('updateData','bankAccount_Bob_1', 'data to update', 16).
wasGeneratedBy('bankAccount_Bob_2', 'updateData', 'updated data', 17).

wasControlledBy('sendAdSMS','DC', 'owner', 18, 21).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 19).
used('sendAdSMS','phoneNumber_Bob_1', 'user phone number', 20).
used('sendAdSMS','ad', 'ad sms', 21).

wasControlledBy('updateConsent','Bob', 'owner', 22, 24).
used('updateConsent', 'consent_Bob_1', 'consent', 23).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 24).


purposes('consent_Bob_2','phoneNumber_Bob_1',['buyItem','refund']).
purposes('consent_Bob_2','id_Bob_1',[]).



wasControlledBy('buyItem','Bob', 'owner', 25, 32).
used('buyItem','bankAccount_Bob_2', 'bank account', 26).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 27, 31).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 28).
used('sendPersonalizationCookie','id_Bob_1', 'user id', 29).
used('sendPersonalizationCookie', 'bankAccount_Bob_2', 'extra data', 30).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 31).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 32).

wasControlledBy('askRefund','Bob', 'owner', 33, 38).
wasControlledBy('sendImprovementCookie','DC', 'owner', 34, 37).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 35).
used('sendImprovementCookie','id_Bob_1', 'user id', 36).

used('sendImprovementCookie','improvement_cookie', 'cookie', 37).

used('askRefund', 'receipt', 'bank account', 38).

wasControlledBy('refund','DC', 'owner', 95469, 95471).
used('refund', 'address_Bob_1', 'extra data', 95470).

used('refund', 'bankAccount_Bob_2', 'bank account', 95471).

wasControlledBy('sendAdSMS','DC', 'owner', 39, 42).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 40).
used('sendAdSMS','phoneNumber_Bob_1', 'user phone number', 41).
used('sendAdSMS','ad', 'ad sms', 42).
wasControlledBy('askDataAccess','Bob','owner', 43, 53).
wasControlledBy('sendImprovementCookie','DC', 'owner', 44, 48).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 45).
used('sendImprovementCookie','id_Bob_1', 'user id', 46).
used('sendImprovementCookie', 'bankAccount_Bob_2', 'extra data', 47).

used('sendImprovementCookie','improvement_cookie', 'cookie', 48).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 49, 52).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 50).
used('sendAnalysisCookie','id_Bob_1', 'user id', 51).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 52).

wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 53).

wasControlledBy('sendData','DC', 'owner', 123996, 123998).
used('sendData', 'data_request_Bob', 'request received', 123997).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 123998).

wasControlledBy('sendData','Bob', 'receiver', 123999, 124000).
used('sendData', 'data_report_Bob', 'request response received', 124000).

wasControlledBy('updateConsent','Bob', 'owner', 54, 56).
used('updateConsent', 'consent_Bob_2', 'consent', 55).
wasGeneratedBy('consent_Bob_3', 'updateConsent', 'consent', 56).


purposes('consent_Bob_3','phoneNumber_Bob_1',['sendAdSMS','buyItem']).
purposes('consent_Bob_3','id_Bob_1',['sendPersonalizationCookie']).



wasControlledBy('buyItem','Bob', 'owner', 57, 67).
used('buyItem','bankAccount_Bob_2', 'bank account', 58).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 59, 62).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 60).
used('sendThirdPartiesCookie','id_Bob_1', 'user id', 61).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 62).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 63, 66).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 64).
used('sendPersonalizationCookie','id_Bob_1', 'user id', 65).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 66).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 67).


used('revokeConsent','consent_Bob_3','revokeConsent', 68).



wasControlledBy('updateData','Bob', 'owner', 69, 71).
used('updateData','phoneNumber_Bob_1', 'data to update', 70).
wasGeneratedBy('phoneNumber_Bob_2', 'updateData', 'updated data', 71).


wasControlledBy('updateConsent','Bob', 'owner', 72, 74).
used('updateConsent', 'consent_Bob_3', 'consent', 73).
wasGeneratedBy('consent_Bob_4', 'updateConsent', 'consent', 74).


purposes('consent_Bob_4','phoneNumber_Bob_2',['sendAdSMS','buyItem']).
purposes('consent_Bob_4','id_Bob_1',['sendAnalysisCookie']).





wasControlledBy('updateData','Bob', 'owner', 75, 77).
used('updateData','phoneNumber_Bob_2', 'data to update', 76).
wasGeneratedBy('phoneNumber_Bob_3', 'updateData', 'updated data', 77).


wasControlledBy('askRefund','Bob', 'owner', 78, 79).

used('askRefund', 'receipt', 'bank account', 79).

wasControlledBy('refund','DC', 'owner', 96932, 96934).
used('refund', 'phoneNumber_Bob_3', 'extra data', 96933).

used('refund', 'bankAccount_Bob_2', 'bank account', 96934).


wasControlledBy('updateConsent','Bob', 'owner', 80, 82).
used('updateConsent', 'consent_Bob_4', 'consent', 81).
wasGeneratedBy('consent_Bob_5', 'updateConsent', 'consent', 82).


purposes('consent_Bob_5','phoneNumber_Bob_3',['sendAdSMS','buyItem','refund']).
purposes('consent_Bob_5','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie']).





wasControlledBy('updateData','Bob', 'owner', 83, 85).
used('updateData','name_Bob_1', 'data to update', 84).
wasGeneratedBy('name_Bob_2', 'updateData', 'updated data', 85).


wasControlledBy('updateConsent','Bob', 'owner', 86, 88).
used('updateConsent', 'consent_Bob_5', 'consent', 87).
wasGeneratedBy('consent_Bob_6', 'updateConsent', 'consent', 88).


purposes('consent_Bob_6','phoneNumber_Bob_3',['sendAdSMS','buyItem','refund']).
purposes('consent_Bob_6','id_Bob_1',['sendAnalysisCookie']).



wasControlledBy('buyItem','Bob', 'owner', 89, 95).
used('buyItem','bankAccount_Bob_2', 'bank account', 90).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 91, 94).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 92).
used('sendPersonalizationCookie','id_Bob_1', 'user id', 93).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 94).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 95).


wasControlledBy('sendMail','DC', 'owner', 96, 103).
wasGeneratedBy('message','sendMail', 'mail to send', 97).
used('sendMail','mail_Bob_1', 'address to send to', 98).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 99, 102).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 100).
used('sendAnalysisCookie','id_Bob_1', 'user id', 101).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 102).

used('sendMail', 'message', 'mail sent', 103).
wasControlledBy('askErase','Bob', 'owner', 104, 110).
used('askErase','bankAccount_Bob_2', 'to erase data', 105).
used('askErase','address_Bob_1', 'to erase data', 106).
used('askErase','phoneNumber_Bob_3', 'to erase data', 107).
used('askErase','mail_Bob_1', 'to erase data', 108).
used('askErase','name_Bob_2', 'to erase data', 109).
used('askErase','id_Bob_1', 'to erase data', 110).


wasControlledBy('delete','DC', 'owner', 42205, 42211).
used('delete','bankAccount_Bob_2', 'erase data', 42205).
used('delete','address_Bob_1', 'erase data', 42206).
used('delete','phoneNumber_Bob_3', 'erase data', 42207).
used('delete','mail_Bob_1', 'erase data', 42208).
used('delete','name_Bob_2', 'erase data', 42209).
used('delete','id_Bob_1', 'erase data', 42210).

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
