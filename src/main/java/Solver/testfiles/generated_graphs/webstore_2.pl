wasControlledBy('createAccount','Alice','owner',1,7).
wasGeneratedBy('bankAccount_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('address_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('phoneNumber_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 7 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 8, 12).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 9).
used('sendAnalysisCookie','id_Alice_1', 'user id', 10).
used('sendAnalysisCookie', 'mail_Alice_1', 'extra data', 11).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 12).


wasControlledBy('askDataAccess','Alice','owner', 13, 18).
wasControlledBy('sendImprovementCookie','DC', 'owner', 14, 17).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 15).
used('sendImprovementCookie','id_Alice_1', 'user id', 16).

used('sendImprovementCookie','improvement_cookie', 'cookie', 17).


wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 18).
wasControlledBy('consent','Alice','owner', 19, 20).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 20).

purposes(_,'bankAccount_Alice_1',['buyItem','askRefund','refund']).
purposes(_,'address_Alice_1',['buyItem']).
purposes('consent_Alice_1','phoneNumber_Alice_1',['sendAdSMS']).
purposes(_,'mail_Alice_1',['sendMail','sendTicket']).
purposes(_,'name_Alice_1',['buyItem']).
purposes('consent_Alice_1','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendPersonalizationCookie']).


wasControlledBy('updateConsent','Alice', 'owner', 21, 23).
used('updateConsent', 'consent_Alice_1', 'consent', 22).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 23).


purposes('consent_Alice_2','phoneNumber_Alice_1',['buyItem','refund']).
purposes('consent_Alice_2','id_Alice_1',['sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).





wasControlledBy('updateData','Alice', 'owner', 24, 26).
used('updateData','phoneNumber_Alice_1', 'data to update', 25).
wasGeneratedBy('phoneNumber_Alice_2', 'updateData', 'updated data', 26).


wasControlledBy('buyItem','Alice', 'owner', 27, 34).
used('buyItem','bankAccount_Alice_1', 'bank account', 28).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 29, 33).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 30).
used('sendPersonalizationCookie','id_Alice_1', 'user id', 31).
used('sendPersonalizationCookie', 'mail_Alice_1', 'extra data', 32).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 33).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 34).

wasControlledBy('sendTicket','Alice', 'owner', 35, 39).
used('sendTicket', 'mail_Alice_1', 'extra data', 36).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 37).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 38).
used('sendTicket', 'ticket', 'ticket sent', 39).





wasControlledBy('updateData','Alice', 'owner', 40, 42).
used('updateData','mail_Alice_1', 'data to update', 41).
wasGeneratedBy('mail_Alice_2', 'updateData', 'updated data', 42).


wasControlledBy('askRefund','Alice', 'owner', 43, 48).
wasControlledBy('sendImprovementCookie','DC', 'owner', 44, 47).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 45).
used('sendImprovementCookie','id_Alice_1', 'user id', 46).

used('sendImprovementCookie','improvement_cookie', 'cookie', 47).

used('askRefund', 'receipt', 'bank account', 48).

wasControlledBy('refund','DC', 'owner', 63478, 63479).

used('refund', 'bankAccount_Alice_1', 'bank account', 63479).

wasControlledBy('buyItem','Alice', 'owner', 49, 55).
used('buyItem','bankAccount_Alice_1', 'bank account', 50).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 51, 54).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 52).
used('sendThirdPartiesCookie','id_Alice_1', 'user id', 53).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 54).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 55).
wasControlledBy('sendMail','DC', 'owner', 56, 64).
wasGeneratedBy('message','sendMail', 'mail to send', 57).
used('sendMail','mail_Alice_2', 'address to send to', 58).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 59, 63).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 60).
used('sendAnalysisCookie','id_Alice_1', 'user id', 61).
used('sendAnalysisCookie', 'mail_Alice_2', 'extra data', 62).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 63).

used('sendMail', 'message', 'mail sent', 64).

wasControlledBy('sendData','DC', 'owner', 74223, 74225).
used('sendData', 'data_request_Alice', 'request received', 74224).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 74225).

wasControlledBy('sendData','Alice', 'receiver', 74226, 74227).
used('sendData', 'data_report_Alice', 'request response received', 74227).
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
purposes('consent_Bob_1','phoneNumber_Bob_1',['buyItem','refund']).
purposes(_,'mail_Bob_1',['sendMail','sendTicket']).
purposes(_,'name_Bob_1',['buyItem']).
purposes('consent_Bob_1','id_Bob_1',['sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).


used('revokeConsent','consent_Bob_1','revokeConsent', 10).
wasControlledBy('sendTicket','Bob', 'owner', 11, 15).
used('sendTicket', 'mail_Bob_1', 'extra data', 12).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 13).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 14).
used('sendTicket', 'ticket', 'ticket sent', 15).



wasControlledBy('sendTicket','DC', 'owner', 58334, 58337).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 58335).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 58336).
used('sendTicket','ticketReply', 'ticket reply sent', 58337).


wasControlledBy('sendTicket','Bob', 'owner', 58338, 58339).
used('sendTicket', 'ticketReply', 'ticket reply received', 58339).



wasControlledBy('updateData','Bob', 'owner', 16, 18).
used('updateData','phoneNumber_Bob_1', 'data to update', 17).
wasGeneratedBy('phoneNumber_Bob_2', 'updateData', 'updated data', 18).


wasControlledBy('buyItem','Bob', 'owner', 19, 25).
used('buyItem','bankAccount_Bob_1', 'bank account', 20).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 21, 24).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 22).
used('sendPersonalizationCookie','id_Bob_1', 'user id', 23).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 24).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 25).

wasControlledBy('askRefund','Bob', 'owner', 26, 27).

used('askRefund', 'receipt', 'bank account', 27).

wasControlledBy('refund','DC', 'owner', 122967, 122968).

used('refund', 'bankAccount_Bob_1', 'bank account', 122968).

wasControlledBy('updateConsent','Bob', 'owner', 28, 30).
used('updateConsent', 'consent_Bob_1', 'consent', 29).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 30).


purposes('consent_Bob_2','phoneNumber_Bob_2',['buyItem','refund']).
purposes('consent_Bob_2','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie']).



wasControlledBy('buyItem','Bob', 'owner', 31, 41).
used('buyItem','bankAccount_Bob_1', 'bank account', 32).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 33, 36).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 34).
used('sendThirdPartiesCookie','id_Bob_1', 'user id', 35).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 36).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 37, 40).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 38).
used('sendPersonalizationCookie','id_Bob_1', 'user id', 39).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 40).

wasGeneratedBy('receipt', 'buyItem', 'receipt', 41).

wasControlledBy('sendMail','DC', 'owner', 42, 50).
wasGeneratedBy('message','sendMail', 'mail to send', 43).
used('sendMail','mail_Bob_1', 'address to send to', 44).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 45, 49).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 46).
used('sendAnalysisCookie','id_Bob_1', 'user id', 47).
used('sendAnalysisCookie', 'address_Bob_1', 'extra data', 48).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 49).

used('sendMail', 'message', 'mail sent', 50).
wasControlledBy('sendAdSMS','DC', 'owner', 51, 54).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 52).
used('sendAdSMS','phoneNumber_Bob_2', 'user phone number', 53).
used('sendAdSMS','ad', 'ad sms', 54).

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
