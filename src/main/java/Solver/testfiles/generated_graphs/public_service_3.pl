wasControlledBy('createAccount','Alice','owner',1,7).
wasGeneratedBy('birthday_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('bankAccount_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('address_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 7 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 8, 11).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 9).
used('sendAnalysisCookie','id_Alice_1', 'user id', 10).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 11).

wasControlledBy('consent','Alice','owner', 12, 18).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 13, 17).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 14).
used('sendAnalysisCookie','id_Alice_1', 'user id', 15).
used('sendAnalysisCookie', 'id_Alice_1', 'extra data', 16).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 17).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 18).

purposes(_,'birthday_Alice_1',['doAdminProcedure']).
purposes(_,'bankAccount_Alice_1',['payFine']).
purposes(_,'address_Alice_1',['useSimulator','doAdminProcedure']).
purposes(_,'mail_Alice_1',['sendMail','doAdminProcedure','sendTicket']).
purposes(_,'name_Alice_1',['useSimulator','doAdminProcedure']).
purposes('consent_Alice_1','id_Alice_1',['sendAnalysisCookie','sendImprovementCookie','sendPersonalizationCookie']).


wasControlledBy('sendTicket','Alice', 'owner', 19, 23).
used('sendTicket', 'bankAccount_Alice_1', 'extra data', 20).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 21).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 22).
used('sendTicket', 'ticket', 'ticket sent', 23).



wasControlledBy('sendTicket','DC', 'owner', 82969, 82972).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 82970).
used('sendTicket','mail_Alice_1', 'ticket reply sent', 82971).
used('sendTicket','ticketReply', 'ticket reply sent', 82972).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 96965, 96968).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 96966).
used('sendAnalysisCookie','id_Alice_1', 'user id', 96967).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 96968).

wasControlledBy('sendImprovementCookie','DC', 'owner', 103416, 103419).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 103417).
used('sendImprovementCookie','id_Alice_1', 'user id', 103418).

used('sendImprovementCookie','improvement_cookie', 'cookie', 103419).

wasControlledBy('sendTicket','Alice', 'owner', 103420, 103421).
used('sendTicket', 'ticketReply', 'ticket reply received', 103421).

wasControlledBy('updateConsent','Alice', 'owner', 24, 26).
used('updateConsent', 'consent_Alice_1', 'consent', 25).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 26).


purposes('consent_Alice_2','id_Alice_1',['sendAnalysisCookie','sendImprovementCookie','sendPersonalizationCookie']).


wasControlledBy('doAdminProcedure','DC', 'owner', 27, 35).
used('doAdminProcedure','name_Alice_1', 'user name', 28).
used('doAdminProcedure','birthday_Alice_1', 'user birth day', 29).
used('doAdminProcedure','address_Alice_1', 'user physical address', 30).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 31, 34).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 32).
used('sendAnalysisCookie','id_Alice_1', 'user id', 33).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 34).

used('doAdminProcedure', 'mail_Alice_1', 'user mail address', 35).

wasControlledBy('payFine','DC', 'owner', 36, 38).
used('payFine', 'bankAccount_Alice_1', 'bank account', 37).

wasGeneratedBy('receipt', 'payFine', 'receipt', 38).
wasControlledBy('askDataAccess','Alice','owner', 39, 40).


wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 40).

wasControlledBy('sendData','DC', 'owner', 128946, 128948).
used('sendData', 'data_request_Alice', 'request received', 128947).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 128948).

wasControlledBy('sendData','Alice', 'receiver', 128949, 128950).
used('sendData', 'data_report_Alice', 'request response received', 128950).
wasControlledBy('sendMail','DC', 'owner', 41, 44).
wasGeneratedBy('message','sendMail', 'mail to send', 42).
used('sendMail','mail_Alice_1', 'address to send to', 43).

used('sendMail', 'message', 'mail sent', 44).
wasControlledBy('useSimulator','Alice', 'owner', 45, 46).
wasGeneratedBy('askUseSimulator', 'useSimulator', 'ask a simulation', 46).

wasControlledBy('useSimulator', 'DC', 'owner', 47, 60).
used('useSimulator', 'askUseSimulator', 'user asked a simulation', 48).
used('useSimulator', 'name_Alice_1', 'simulator user', 49).
used('useSimulator', 'address_Alice_1', 'simulator user physical address', 50).

wasControlledBy('sendImprovementCookie','DC', 'owner', 51, 55).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 52).
used('sendImprovementCookie','id_Alice_1', 'user id', 53).
used('sendImprovementCookie', 'birthday_Alice_1', 'extra data', 54).

used('sendImprovementCookie','improvement_cookie', 'cookie', 55).

wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 56, 59).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 57).
used('sendThirdPartiesCookie','id_Alice_1', 'user id', 58).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 59).

wasGeneratedBy('simulatorResults', 'useSimulator', 'simulator results', 60).

used('revokeConsent','consent_Alice_2','revokeConsent', 61).
wasControlledBy('doAdminProcedure','DC', 'owner', 62, 66).
used('doAdminProcedure','name_Alice_1', 'user name', 63).
used('doAdminProcedure','birthday_Alice_1', 'user birth day', 64).
used('doAdminProcedure','address_Alice_1', 'user physical address', 65).

used('doAdminProcedure', 'mail_Alice_1', 'user mail address', 66).
wasControlledBy('createAccount','Bob','owner',1,7).
wasGeneratedBy('birthday_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('bankAccount_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('address_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 7 ).


wasControlledBy('consent','Bob','owner', 8, 9).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 9).

purposes(_,'birthday_Bob_1',['doAdminProcedure']).
purposes(_,'bankAccount_Bob_1',['payFine']).
purposes(_,'address_Bob_1',['useSimulator','doAdminProcedure']).
purposes(_,'mail_Bob_1',['sendMail','doAdminProcedure','sendTicket']).
purposes(_,'name_Bob_1',['useSimulator','doAdminProcedure']).
purposes('consent_Bob_1','id_Bob_1',['sendAnalysisCookie','sendImprovementCookie','sendPersonalizationCookie']).



used('revokeConsent','consent_Bob_1','revokeConsent', 10).
wasControlledBy('sendMail','DC', 'owner', 11, 14).
wasGeneratedBy('message','sendMail', 'mail to send', 12).
used('sendMail','mail_Bob_1', 'address to send to', 13).

used('sendMail', 'message', 'mail sent', 14).

wasControlledBy('updateConsent','Bob', 'owner', 15, 17).
used('updateConsent', 'consent_Bob_1', 'consent', 16).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 17).


purposes('consent_Bob_2','id_Bob_1',['sendAnalysisCookie','sendImprovementCookie']).


wasControlledBy('useSimulator','Bob', 'owner', 18, 19).
wasGeneratedBy('askUseSimulator', 'useSimulator', 'ask a simulation', 19).

wasControlledBy('useSimulator', 'DC', 'owner', 20, 28).
used('useSimulator', 'askUseSimulator', 'user asked a simulation', 21).
used('useSimulator', 'name_Bob_1', 'simulator user', 22).
used('useSimulator', 'address_Bob_1', 'simulator user physical address', 23).

wasControlledBy('sendImprovementCookie','DC', 'owner', 24, 27).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 25).
used('sendImprovementCookie','id_Bob_1', 'user id', 26).

used('sendImprovementCookie','improvement_cookie', 'cookie', 27).


wasGeneratedBy('simulatorResults', 'useSimulator', 'simulator results', 28).

wasControlledBy('askDataAccess','Bob','owner', 29, 35).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 30, 34).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 31).
used('sendAnalysisCookie','id_Bob_1', 'user id', 32).
used('sendAnalysisCookie', 'bankAccount_Bob_1', 'extra data', 33).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 34).

wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 35).

wasControlledBy('sendData','DC', 'owner', 71509, 71511).
used('sendData', 'data_request_Bob', 'request received', 71510).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 71511).

wasControlledBy('sendData','Bob', 'receiver', 71512, 71513).
used('sendData', 'data_report_Bob', 'request response received', 71513).
wasControlledBy('sendTicket','Bob', 'owner', 36, 40).
used('sendTicket', 'name_Bob_1', 'extra data', 37).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 38).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 39).
used('sendTicket', 'ticket', 'ticket sent', 40).



wasControlledBy('sendTicket','DC', 'owner', 44993, 44996).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 44994).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 44995).
used('sendTicket','ticketReply', 'ticket reply sent', 44996).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 71513, 71516).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 71514).
used('sendAnalysisCookie','id_Bob_1', 'user id', 71515).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 71516).


wasControlledBy('sendTicket','Bob', 'owner', 71517, 71518).
used('sendTicket', 'ticketReply', 'ticket reply received', 71518).
wasControlledBy('payFine','DC', 'owner', 41, 43).
used('payFine', 'bankAccount_Bob_1', 'bank account', 42).

wasGeneratedBy('receipt', 'payFine', 'receipt', 43).



wasControlledBy('updateData','Bob', 'owner', 44, 46).
used('updateData','bankAccount_Bob_1', 'data to update', 45).
wasGeneratedBy('bankAccount_Bob_2', 'updateData', 'updated data', 46).

wasControlledBy('doAdminProcedure','DC', 'owner', 47, 51).
used('doAdminProcedure','name_Bob_1', 'user name', 48).
used('doAdminProcedure','birthday_Bob_1', 'user birth day', 49).
used('doAdminProcedure','address_Bob_1', 'user physical address', 50).

used('doAdminProcedure', 'mail_Bob_1', 'user mail address', 51).
wasControlledBy('askErase','Bob', 'owner', 52, 58).
used('askErase','birthday_Bob_1', 'to erase data', 53).
used('askErase','bankAccount_Bob_2', 'to erase data', 54).
used('askErase','address_Bob_1', 'to erase data', 55).
used('askErase','mail_Bob_1', 'to erase data', 56).
used('askErase','name_Bob_1', 'to erase data', 57).
used('askErase','id_Bob_1', 'to erase data', 58).



action('sendData', 'sendData').
action('useSimulator', 'useSimulator').
action('sendThirdPartiesCookie', 'sendThirdPartiesCookie').
action('updateData', 'updateData').
action('sendAdSMS', 'sendAdSMS').
action('sendMail', 'sendMail').
action('sendImprovementCookie', 'sendImprovementCookie').
action('payFine', 'payFine').
action('doAdminProcedure', 'doAdminProcedure').
action('createAccount', 'createAccount').
action('consent', 'consent').
action('login', 'login').
action('delete', 'delete').
action('askDataAccess', 'askDataAccess').
action('sendTicket', 'sendTicket').
action('sendPersonalizationCookie', 'sendPersonalizationCookie').
action('sendAnalysisCookie', 'sendAnalysisCookie').
action('providePolicy', 'providePolicy').
action('askErase', 'askErase').
action('updateConsent', 'updateConsent').
purposes(_,_,['consent','delete','askErase','sendData','askDataAccess','updateConsent','accessWebPage','updateData','createAccount','login']).
