wasControlledBy('createAccount','Alice','owner',1,7).
wasGeneratedBy('birthday_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('bankAccount_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('address_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 7 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 8, 12).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 9).
used('sendAnalysisCookie','id_Alice_1', 'user id', 10).
used('sendAnalysisCookie', 'birthday_Alice_1', 'extra data', 11).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 12).

wasControlledBy('consent','Alice','owner', 13, 14).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 14).

purposes(_,'birthday_Alice_1',['doAdminProcedure']).
purposes(_,'bankAccount_Alice_1',['payFine']).
purposes(_,'address_Alice_1',['useSimulator','doAdminProcedure']).
purposes(_,'mail_Alice_1',['sendMail','doAdminProcedure','sendTicket']).
purposes(_,'name_Alice_1',['useSimulator','doAdminProcedure']).
purposes('consent_Alice_1','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendPersonalizationCookie']).


wasControlledBy('sendTicket','Alice', 'owner', 15, 19).
used('sendTicket', 'mail_Alice_1', 'extra data', 16).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 17).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 18).
used('sendTicket', 'ticket', 'ticket sent', 19).



used('revokeConsent','consent_Alice_1','revokeConsent', 20).

wasControlledBy('updateConsent','Alice', 'owner', 21, 23).
used('updateConsent', 'consent_Alice_1', 'consent', 22).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 23).


purposes('consent_Alice_2','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).





wasControlledBy('updateData','Alice', 'owner', 24, 26).
used('updateData','name_Alice_1', 'data to update', 25).
wasGeneratedBy('name_Alice_2', 'updateData', 'updated data', 26).


wasControlledBy('updateConsent','Alice', 'owner', 27, 29).
used('updateConsent', 'consent_Alice_2', 'consent', 28).
wasGeneratedBy('consent_Alice_3', 'updateConsent', 'consent', 29).


purposes('consent_Alice_3','id_Alice_1',['sendAnalysisCookie','sendImprovementCookie','sendPersonalizationCookie']).


wasControlledBy('doAdminProcedure','DC', 'owner', 30, 34).
used('doAdminProcedure','name_Alice_2', 'user name', 31).
used('doAdminProcedure','birthday_Alice_1', 'user birth day', 32).
used('doAdminProcedure','address_Alice_1', 'user physical address', 33).

used('doAdminProcedure', 'mail_Alice_1', 'user mail address', 34).





wasControlledBy('updateData','Alice', 'owner', 35, 37).
used('updateData','birthday_Alice_1', 'data to update', 36).
wasGeneratedBy('birthday_Alice_2', 'updateData', 'updated data', 37).


wasControlledBy('updateConsent','Alice', 'owner', 38, 40).
used('updateConsent', 'consent_Alice_3', 'consent', 39).
wasGeneratedBy('consent_Alice_4', 'updateConsent', 'consent', 40).


purposes('consent_Alice_4','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).


wasControlledBy('useSimulator','Alice', 'owner', 41, 42).
wasGeneratedBy('askUseSimulator', 'useSimulator', 'ask a simulation', 42).

wasControlledBy('useSimulator', 'DC', 'owner', 43, 51).
used('useSimulator', 'askUseSimulator', 'user asked a simulation', 44).
used('useSimulator', 'name_Alice_2', 'simulator user', 45).
used('useSimulator', 'address_Alice_1', 'simulator user physical address', 46).


wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 47, 50).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 48).
used('sendThirdPartiesCookie','id_Alice_1', 'user id', 49).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 50).

wasGeneratedBy('simulatorResults', 'useSimulator', 'simulator results', 51).

wasControlledBy('payFine','DC', 'owner', 52, 55).
used('payFine', 'bankAccount_Alice_1', 'bank account', 53).
used('payFine', 'name_Alice_2', 'extra data', 54).

wasGeneratedBy('receipt', 'payFine', 'receipt', 55).
wasControlledBy('askDataAccess','Alice','owner', 56, 61).
wasControlledBy('sendImprovementCookie','DC', 'owner', 57, 60).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 58).
used('sendImprovementCookie','id_Alice_1', 'user id', 59).

used('sendImprovementCookie','improvement_cookie', 'cookie', 60).


wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 61).

wasControlledBy('sendTicket','DC', 'owner', 96606, 96609).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 96607).
used('sendTicket','mail_Alice_1', 'ticket reply sent', 96608).
used('sendTicket','ticketReply', 'ticket reply sent', 96609).


wasControlledBy('sendTicket','Alice', 'owner', 96610, 96611).
used('sendTicket', 'ticketReply', 'ticket reply received', 96611).
wasControlledBy('createAccount','Bob','owner',1,7).
wasGeneratedBy('birthday_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('bankAccount_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('address_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 7 ).



wasControlledBy('consent','Bob','owner', 8, 13).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 9, 12).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 10).
used('sendAnalysisCookie','id_Bob_1', 'user id', 11).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 12).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 13).

purposes(_,'birthday_Bob_1',['doAdminProcedure']).
purposes(_,'bankAccount_Bob_1',['payFine']).
purposes(_,'address_Bob_1',['useSimulator','doAdminProcedure']).
purposes(_,'mail_Bob_1',['sendMail','doAdminProcedure','sendTicket']).
purposes(_,'name_Bob_1',['useSimulator','doAdminProcedure']).
purposes('consent_Bob_1','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).


used('revokeConsent','consent_Bob_1','revokeConsent', 14).



wasControlledBy('updateData','Bob', 'owner', 15, 17).
used('updateData','birthday_Bob_1', 'data to update', 16).
wasGeneratedBy('birthday_Bob_2', 'updateData', 'updated data', 17).


wasControlledBy('updateConsent','Bob', 'owner', 18, 20).
used('updateConsent', 'consent_Bob_1', 'consent', 19).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 20).


purposes('consent_Bob_2','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie']).


wasControlledBy('useSimulator','Bob', 'owner', 21, 22).
wasGeneratedBy('askUseSimulator', 'useSimulator', 'ask a simulation', 22).

wasControlledBy('useSimulator', 'DC', 'owner', 23, 31).
used('useSimulator', 'askUseSimulator', 'user asked a simulation', 24).
used('useSimulator', 'name_Bob_1', 'simulator user', 25).
used('useSimulator', 'address_Bob_1', 'simulator user physical address', 26).


wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 27, 30).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 28).
used('sendThirdPartiesCookie','id_Bob_1', 'user id', 29).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 30).

wasGeneratedBy('simulatorResults', 'useSimulator', 'simulator results', 31).

wasControlledBy('payFine','DC', 'owner', 32, 34).
used('payFine', 'bankAccount_Bob_1', 'bank account', 33).

wasGeneratedBy('receipt', 'payFine', 'receipt', 34).
wasControlledBy('sendMail','DC', 'owner', 35, 38).
wasGeneratedBy('message','sendMail', 'mail to send', 36).
used('sendMail','mail_Bob_1', 'address to send to', 37).

used('sendMail', 'message', 'mail sent', 38).
wasControlledBy('askDataAccess','Bob','owner', 39, 40).


wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 40).
wasControlledBy('payFine','DC', 'owner', 41, 44).
used('payFine', 'bankAccount_Bob_1', 'bank account', 42).
used('payFine', 'name_Bob_1', 'extra data', 43).

wasGeneratedBy('receipt', 'payFine', 'receipt', 44).
wasControlledBy('sendTicket','Bob', 'owner', 45, 48).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 46).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 47).
used('sendTicket', 'ticket', 'ticket sent', 48).



wasControlledBy('sendTicket','DC', 'owner', 79250, 79253).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 79251).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 79252).
used('sendTicket','ticketReply', 'ticket reply sent', 79253).

wasControlledBy('sendImprovementCookie','DC', 'owner', 25401, 25405).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 25402).
used('sendImprovementCookie','id_Bob_1', 'user id', 25403).
used('sendImprovementCookie', 'name_Bob_1', 'extra data', 25404).

used('sendImprovementCookie','improvement_cookie', 'cookie', 25405).

wasControlledBy('sendTicket','Bob', 'owner', 25406, 25407).
used('sendTicket', 'ticketReply', 'ticket reply received', 25407).

wasControlledBy('updateConsent','Bob', 'owner', 49, 51).
used('updateConsent', 'consent_Bob_2', 'consent', 50).
wasGeneratedBy('consent_Bob_3', 'updateConsent', 'consent', 51).


purposes('consent_Bob_3','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie']).


wasControlledBy('payFine','DC', 'owner', 52, 55).
used('payFine', 'bankAccount_Bob_1', 'bank account', 53).
used('payFine', 'mail_Bob_1', 'extra data', 54).

wasGeneratedBy('receipt', 'payFine', 'receipt', 55).

wasControlledBy('askErase','Bob', 'owner', 56, 62).
used('askErase','birthday_Bob_2', 'to erase data', 57).
used('askErase','bankAccount_Bob_1', 'to erase data', 58).
used('askErase','address_Bob_1', 'to erase data', 59).
used('askErase','mail_Bob_1', 'to erase data', 60).
used('askErase','name_Bob_1', 'to erase data', 61).
used('askErase','id_Bob_1', 'to erase data', 62).



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
