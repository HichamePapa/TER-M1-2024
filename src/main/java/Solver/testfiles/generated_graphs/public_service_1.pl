wasControlledBy('createAccount','Alice','owner',1,7).
wasGeneratedBy('birthday_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('bankAccount_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('address_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 7 ).


wasControlledBy('consent','Alice','owner', 8, 14).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 9, 13).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 10).
used('sendAnalysisCookie','id_Alice_1', 'user id', 11).
used('sendAnalysisCookie', 'name_Alice_1', 'extra data', 12).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 13).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 14).

purposes(_,'birthday_Alice_1',['doAdminProcedure']).
purposes(_,'bankAccount_Alice_1',['payFine']).
purposes(_,'address_Alice_1',['useSimulator','doAdminProcedure']).
purposes(_,'mail_Alice_1',['sendMail','doAdminProcedure','sendTicket']).
purposes(_,'name_Alice_1',['useSimulator','doAdminProcedure']).
purposes('consent_Alice_1','id_Alice_1',['sendAnalysisCookie','sendImprovementCookie']).



used('revokeConsent','consent_Alice_1','revokeConsent', 15).
wasControlledBy('sendTicket','Alice', 'owner', 16, 19).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 17).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 18).
used('sendTicket', 'ticket', 'ticket sent', 19).


wasControlledBy('askDataAccess','Alice','owner', 20, 26).
wasControlledBy('sendImprovementCookie','DC', 'owner', 21, 25).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 22).
used('sendImprovementCookie','id_Alice_1', 'user id', 23).
used('sendImprovementCookie', 'bankAccount_Alice_1', 'extra data', 24).

used('sendImprovementCookie','improvement_cookie', 'cookie', 25).


wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 26).
wasControlledBy('sendMail','DC', 'owner', 27, 30).
wasGeneratedBy('message','sendMail', 'mail to send', 28).
used('sendMail','mail_Alice_1', 'address to send to', 29).

used('sendMail', 'message', 'mail sent', 30).
wasControlledBy('doAdminProcedure','DC', 'owner', 31, 39).
used('doAdminProcedure','name_Alice_1', 'user name', 32).
used('doAdminProcedure','birthday_Alice_1', 'user birth day', 33).
used('doAdminProcedure','address_Alice_1', 'user physical address', 34).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 35, 38).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 36).
used('sendAnalysisCookie','id_Alice_1', 'user id', 37).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 38).

used('doAdminProcedure', 'mail_Alice_1', 'user mail address', 39).

wasControlledBy('updateConsent','Alice', 'owner', 40, 42).
used('updateConsent', 'consent_Alice_1', 'consent', 41).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 42).


purposes('consent_Alice_2','id_Alice_1',['sendAnalysisCookie','sendImprovementCookie']).


wasControlledBy('useSimulator','Alice', 'owner', 43, 44).
wasGeneratedBy('askUseSimulator', 'useSimulator', 'ask a simulation', 44).

wasControlledBy('useSimulator', 'DC', 'owner', 45, 54).
used('useSimulator', 'askUseSimulator', 'user asked a simulation', 46).
used('useSimulator', 'name_Alice_1', 'simulator user', 47).
used('useSimulator', 'address_Alice_1', 'simulator user physical address', 48).
used('useSimulator', 'name_Alice_1', 'extra data', 49).


wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 50, 53).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 51).
used('sendThirdPartiesCookie','id_Alice_1', 'user id', 52).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 53).

wasGeneratedBy('simulatorResults', 'useSimulator', 'simulator results', 54).

wasControlledBy('createAccount','Bob','owner',1,7).
wasGeneratedBy('birthday_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('bankAccount_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('address_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 7 ).


wasControlledBy('consent','Bob','owner', 8, 14).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 9, 13).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 10).
used('sendAnalysisCookie','id_Bob_1', 'user id', 11).
used('sendAnalysisCookie', 'mail_Bob_1', 'extra data', 12).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 13).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 14).

purposes(_,'birthday_Bob_1',['doAdminProcedure']).
purposes(_,'bankAccount_Bob_1',['payFine']).
purposes(_,'address_Bob_1',['useSimulator','doAdminProcedure']).
purposes(_,'mail_Bob_1',['sendMail','doAdminProcedure','sendTicket']).
purposes(_,'name_Bob_1',['useSimulator','doAdminProcedure']).
purposes('consent_Bob_1','id_Bob_1',['sendAnalysisCookie','sendImprovementCookie']).





wasControlledBy('updateData','Bob', 'owner', 15, 17).
used('updateData','name_Bob_1', 'data to update', 16).
wasGeneratedBy('name_Bob_2', 'updateData', 'updated data', 17).


wasControlledBy('updateConsent','Bob', 'owner', 18, 20).
used('updateConsent', 'consent_Bob_1', 'consent', 19).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 20).


purposes('consent_Bob_2','id_Bob_1',['sendAnalysisCookie','sendImprovementCookie','sendPersonalizationCookie']).


wasControlledBy('doAdminProcedure','DC', 'owner', 21, 25).
used('doAdminProcedure','name_Bob_2', 'user name', 22).
used('doAdminProcedure','birthday_Bob_1', 'user birth day', 23).
used('doAdminProcedure','address_Bob_1', 'user physical address', 24).

used('doAdminProcedure', 'mail_Bob_1', 'user mail address', 25).

wasControlledBy('sendMail','DC', 'owner', 26, 29).
wasGeneratedBy('message','sendMail', 'mail to send', 27).
used('sendMail','mail_Bob_1', 'address to send to', 28).

used('sendMail', 'message', 'mail sent', 29).
wasControlledBy('sendTicket','Bob', 'owner', 30, 33).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 31).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 32).
used('sendTicket', 'ticket', 'ticket sent', 33).



wasControlledBy('sendTicket','DC', 'owner', 108165, 108168).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 108166).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 108167).
used('sendTicket','ticketReply', 'ticket reply sent', 108168).


wasControlledBy('sendTicket','Bob', 'owner', 108169, 108170).
used('sendTicket', 'ticketReply', 'ticket reply received', 108170).
wasControlledBy('askDataAccess','Bob','owner', 34, 35).


wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 35).

wasControlledBy('sendData','DC', 'owner', 129242, 129244).
used('sendData', 'data_request_Bob', 'request received', 129243).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 129244).

wasControlledBy('sendData','Bob', 'receiver', 129245, 129246).
used('sendData', 'data_report_Bob', 'request response received', 129246).
wasControlledBy('askErase','Bob', 'owner', 36, 42).
used('askErase','birthday_Bob_1', 'to erase data', 37).
used('askErase','bankAccount_Bob_1', 'to erase data', 38).
used('askErase','address_Bob_1', 'to erase data', 39).
used('askErase','mail_Bob_1', 'to erase data', 40).
used('askErase','name_Bob_2', 'to erase data', 41).
used('askErase','id_Bob_1', 'to erase data', 42).



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
