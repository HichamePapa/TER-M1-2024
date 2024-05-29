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

wasControlledBy('consent','Alice','owner', 12, 18).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 13, 17).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 14).
used('sendAnalysisCookie','id_Alice_1', 'user id', 15).
used('sendAnalysisCookie', 'address_Alice_1', 'extra data', 16).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 17).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 18).

purposes(_,'bankAccount_Alice_1',['buyItem','askRefund','refund']).
purposes(_,'address_Alice_1',['buyItem']).
purposes('consent_Alice_1','phoneNumber_Alice_1',['sendAdSMS','refund']).
purposes(_,'mail_Alice_1',['sendMail','sendTicket']).
purposes(_,'name_Alice_1',['buyItem']).
purposes('consent_Alice_1','id_Alice_1',['sendImprovementCookie']).

wasControlledBy('updateConsent','Alice', 'owner', 19, 21).
used('updateConsent', 'consent_Alice_1', 'consent', 20).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 21).


purposes('consent_Alice_2','phoneNumber_Alice_1',['sendAdSMS','buyItem','refund']).
purposes('consent_Alice_2','id_Alice_1',['sendThirdPartiesCookie']).


wasControlledBy('sendAdSMS','DC', 'owner', 22, 25).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 23).
used('sendAdSMS','phoneNumber_Alice_1', 'user phone number', 24).
used('sendAdSMS','ad', 'ad sms', 25).

wasControlledBy('sendTicket','Alice', 'owner', 26, 30).
used('sendTicket', 'id_Alice_1', 'extra data', 27).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 28).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 29).
used('sendTicket', 'ticket', 'ticket sent', 30).



wasControlledBy('sendTicket','DC', 'owner', 123001, 123004).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 123002).
used('sendTicket','mail_Alice_1', 'ticket reply sent', 123003).
used('sendTicket','ticketReply', 'ticket reply sent', 123004).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 123221, 123225).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 123222).
used('sendAnalysisCookie','id_Alice_1', 'user id', 123223).
used('sendAnalysisCookie', 'mail_Alice_1', 'extra data', 123224).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 123225).


wasControlledBy('sendTicket','Alice', 'owner', 123226, 123227).
used('sendTicket', 'ticketReply', 'ticket reply received', 123227).
wasControlledBy('askDataAccess','Alice','owner', 31, 36).
wasControlledBy('sendImprovementCookie','DC', 'owner', 32, 35).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 33).
used('sendImprovementCookie','id_Alice_1', 'user id', 34).

used('sendImprovementCookie','improvement_cookie', 'cookie', 35).


wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 36).

wasControlledBy('sendData','DC', 'owner', 85864, 85866).
used('sendData', 'data_request_Alice', 'request received', 85865).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 85866).

wasControlledBy('sendData','Alice', 'receiver', 85867, 85868).
used('sendData', 'data_report_Alice', 'request response received', 85868).

used('revokeConsent','consent_Alice_2','revokeConsent', 37).



wasControlledBy('updateData','Alice', 'owner', 38, 40).
used('updateData','bankAccount_Alice_1', 'data to update', 39).
wasGeneratedBy('bankAccount_Alice_2', 'updateData', 'updated data', 40).


wasControlledBy('buyItem','Alice', 'owner', 41, 48).
used('buyItem','bankAccount_Alice_2', 'bank account', 42).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 43, 47).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 44).
used('sendThirdPartiesCookie','id_Alice_1', 'user id', 45).
used('sendThirdPartiesCookie', 'address_Alice_1', 'extra data', 46).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 47).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 48).
wasControlledBy('createAccount','Bob','owner',1,7).
wasGeneratedBy('bankAccount_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('address_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('phoneNumber_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 7 ).


wasControlledBy('consent','Bob','owner', 8, 14).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 9, 13).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 10).
used('sendAnalysisCookie','id_Bob_1', 'user id', 11).
used('sendAnalysisCookie', 'bankAccount_Bob_1', 'extra data', 12).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 13).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 14).

purposes(_,'bankAccount_Bob_1',['buyItem','askRefund','refund']).
purposes(_,'address_Bob_1',['buyItem']).
purposes('consent_Bob_1','phoneNumber_Bob_1',['sendAdSMS','buyItem','refund']).
purposes(_,'mail_Bob_1',['sendMail','sendTicket']).
purposes(_,'name_Bob_1',['buyItem']).
purposes('consent_Bob_1','id_Bob_1',['sendThirdPartiesCookie']).
wasControlledBy('askDataAccess','Bob','owner', 15, 20).
wasControlledBy('sendImprovementCookie','DC', 'owner', 16, 19).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 17).
used('sendImprovementCookie','id_Bob_1', 'user id', 18).

used('sendImprovementCookie','improvement_cookie', 'cookie', 19).


wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 20).

wasControlledBy('sendData','DC', 'owner', 64533, 64535).
used('sendData', 'data_request_Bob', 'request received', 64534).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 64535).

wasControlledBy('sendData','Bob', 'receiver', 64536, 64537).
used('sendData', 'data_report_Bob', 'request response received', 64537).
wasControlledBy('sendAdSMS','DC', 'owner', 21, 24).
wasGeneratedBy('ad', 'sendAdSMS', 'ad to send', 22).
used('sendAdSMS','phoneNumber_Bob_1', 'user phone number', 23).
used('sendAdSMS','ad', 'ad sms', 24).



wasControlledBy('updateData','Bob', 'owner', 25, 27).
used('updateData','bankAccount_Bob_1', 'data to update', 26).
wasGeneratedBy('bankAccount_Bob_2', 'updateData', 'updated data', 27).


wasControlledBy('buyItem','Bob', 'owner', 28, 30).
used('buyItem','bankAccount_Bob_2', 'bank account', 29).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 30).

wasControlledBy('askRefund','Bob', 'owner', 31, 37).
wasControlledBy('sendImprovementCookie','DC', 'owner', 32, 36).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 33).
used('sendImprovementCookie','id_Bob_1', 'user id', 34).
used('sendImprovementCookie', 'bankAccount_Bob_2', 'extra data', 35).

used('sendImprovementCookie','improvement_cookie', 'cookie', 36).

used('askRefund', 'receipt', 'bank account', 37).

wasControlledBy('refund','DC', 'owner', 94439, 94440).

used('refund', 'bankAccount_Bob_2', 'bank account', 94440).
wasControlledBy('sendTicket','Bob', 'owner', 38, 41).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 39).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 40).
used('sendTicket', 'ticket', 'ticket sent', 41).



wasControlledBy('sendTicket','DC', 'owner', 65669, 65672).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 65670).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 65671).
used('sendTicket','ticketReply', 'ticket reply sent', 65672).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 76721, 76724).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 76722).
used('sendAnalysisCookie','id_Bob_1', 'user id', 76723).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 76724).

wasControlledBy('sendImprovementCookie','DC', 'owner', 124330, 124334).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 124331).
used('sendImprovementCookie','id_Bob_1', 'user id', 124332).
used('sendImprovementCookie', 'name_Bob_1', 'extra data', 124333).

used('sendImprovementCookie','improvement_cookie', 'cookie', 124334).

wasControlledBy('sendTicket','Bob', 'owner', 124335, 124336).
used('sendTicket', 'ticketReply', 'ticket reply received', 124336).

wasControlledBy('updateConsent','Bob', 'owner', 42, 44).
used('updateConsent', 'consent_Bob_1', 'consent', 43).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 44).


purposes('consent_Bob_2','phoneNumber_Bob_1',['sendAdSMS','buyItem','refund']).
purposes('consent_Bob_2','id_Bob_1',['sendImprovementCookie']).



wasControlledBy('buyItem','Bob', 'owner', 45, 52).
used('buyItem','bankAccount_Bob_2', 'bank account', 46).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 47, 51).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 48).
used('sendThirdPartiesCookie','id_Bob_1', 'user id', 49).
used('sendThirdPartiesCookie', 'name_Bob_1', 'extra data', 50).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 51).


wasGeneratedBy('receipt', 'buyItem', 'receipt', 52).

wasControlledBy('sendMail','DC', 'owner', 53, 56).
wasGeneratedBy('message','sendMail', 'mail to send', 54).
used('sendMail','mail_Bob_1', 'address to send to', 55).

used('sendMail', 'message', 'mail sent', 56).

used('revokeConsent','consent_Bob_2','revokeConsent', 57).
wasControlledBy('askErase','Bob', 'owner', 58, 64).
used('askErase','bankAccount_Bob_2', 'to erase data', 59).
used('askErase','address_Bob_1', 'to erase data', 60).
used('askErase','phoneNumber_Bob_1', 'to erase data', 61).
used('askErase','mail_Bob_1', 'to erase data', 62).
used('askErase','name_Bob_1', 'to erase data', 63).
used('askErase','id_Bob_1', 'to erase data', 64).



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
