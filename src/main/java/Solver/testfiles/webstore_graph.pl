wasControlledBy('createAccount','Alice','owner',1,7).
wasGeneratedBy('bankAccount_Alice_1','createAccount','personal data',2).
wasGeneratedBy('phoneNumber_Alice_1','createAccount','personal data',3).
wasGeneratedBy('mail_Alice_1','createAccount','personal data',4).
wasGeneratedBy('name_Alice_1','createAccount','personal data',5).
wasGeneratedBy('physicalAddress_Alice_1','createAccount','personal data',6).
wasGeneratedBy('id_Alice_1','createAccount','personal data',7).




wasControlledBy('askErase','Alice','owner',8,9).
used('askErase','bankAccount_Alice_1','toerasedata',9).
wasControlledBy('sendMail','DC','owner',10,17).
wasGeneratedBy('message','sendMail','mailtosend',11).
used('sendMail','mail_Alice_1','addresstosendto',12).
wasControlledBy('sendAnalysisCookie','DC','owner',13,16).
wasGeneratedBy('analysis_cookie','sendAnalysisCookie','cookietosend',14).
used('sendAnalysisCookie','id_Alice_1','userid',15).

used('sendAnalysisCookie','analysis_cookie','cookie',16).

used('sendMail','message','mailsent',17).



wasControlledBy('updateData','Alice','owner',18,20).
used('updateData','phoneNumber_Alice_1','datatoupdate',19).
wasGeneratedBy('phoneNumber_Alice_2','updateData','updateddata',20).

wasControlledBy('consent','Alice','owner',21,26).
wasControlledBy('sendAnalysisCookie','DC','owner',22,25).
wasGeneratedBy('analysis_cookie','sendAnalysisCookie','cookietosend',23).
used('sendAnalysisCookie','id_Alice_1','userid',24).

used('sendAnalysisCookie','analysis_cookie','cookie',25).

wasGeneratedBy('consent_Alice_1','consent','consent',26).

purposes(_,'bankAccount_Alice_1',['buyItem','askRefund','refund']).
purposes('consent_Alice_1','phoneNumber_Alice_2',['refund']).
purposes(_,'mail_Alice_1',['sendMail','sendTicket']).
purposes(_,'name_Alice_1',['buyItem']).
purposes(_,'physicalAddress_Alice_1',['buyItem']).
purposes('consent_Alice_1','id_Alice_1',['sendAnalysisCookie','sendPersonalizationCookie']).

wasControlledBy('updateConsent','Alice','owner',27,29).
wasGeneratedBy('consent_Alice_2','update','consent',28).
used('updateConsent','consent_Alice_2','consent',29).

purposes('consent_Alice_2','phoneNumber_Alice_2',['sendAdSMS']).
purposes('consent_Alice_2','id_Alice_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie','sendPersonalizationCookie']).





wasControlledBy('updateData','Alice','owner',30,32).
used('updateData','phoneNumber_Alice_2','datatoupdate',31).
wasGeneratedBy('phoneNumber_Alice_3','updateData','updateddata',32).


wasControlledBy('buyItem','Alice','owner',33,39).
used('buyItem','bankAccount_Alice_1','bankaccount',34).
wasControlledBy('sendThirdPartiesCookie','DC','owner',35,38).
wasGeneratedBy('marketing_cookie','sendThirdPartiesCookie','cookietosend',36).
used('sendThirdPartiesCookie','id_Alice_1','userid',37).

used('sendThirdPartiesCookie','marketing_cookie','cookie',38).

wasGeneratedBy('receipt','buyItem','receipt',39).



used('revokeConsent','consent_Alice_2','revokeConsent',49).
wasControlledBy('askDataAccess','Alice','owner',50,51).


wasGeneratedBy('data_request','askDataAccess','request',51).
wasControlledBy('sendAdSMS','DC','owner',52,55).
wasGeneratedBy('ad','sendAdSMS','adtosend',53).
used('sendAdSMS','phoneNumber_Alice_3','userid',54).
used('sendAdSMS','ad','adsms',55).
wasControlledBy('sendTicket','Alice','owner',56,59).

used('sendTicket','mail_Alice_1','ticketsendermail',57).
wasGeneratedBy('ticket','sendTicket','tickettosend',58).
used('sendTicket','ticket','ticketsent',59).



wasControlledBy('sendTicket','DC','owner',83470,83473).
wasGeneratedBy('ticketReply','sendTicket','ticketreply',83471).
used('sendTicket','mail_Alice_1','ticketreplysent',83472).
used('sendTicket','ticketReply','ticketreplysent',83473).
wasControlledBy('sendAnalysisCookie','DC','owner',112268,112271).
wasGeneratedBy('analysis_cookie','sendAnalysisCookie','cookietosend',112269).
used('sendAnalysisCookie','id_Alice_1','userid',112270).

used('sendAnalysisCookie','analysis_cookie','cookie',112271).

wasControlledBy('sendImprovementCookie','DC','owner',68372,68375).
wasGeneratedBy('improvement_cookie','sendImprovementCookie','cookietosend',68373).
used('sendImprovementCookie','id_Alice_1','userid',68374).

used('sendImprovementCookie','improvement_cookie','cookie',68375).

wasControlledBy('sendTicket','Alice','owner',68376,68377).
used('sendTicket','ticketReply','ticketreplyreceived',68377).

wasControlledBy('updateConsent','Alice','owner',60,62).
wasGeneratedBy('consent_Alice_3','update','consent',61).
used('updateConsent','consent_Alice_3','consent',62).

purposes('consent_Alice_3','phoneNumber_Alice_3',['refund']).
purposes('consent_Alice_3','id_Alice_1',['sendThirdPartiesCookie','sendImprovementCookie']).


wasControlledBy('sendAdSMS','DC','owner',63,66).
wasGeneratedBy('ad','sendAdSMS','adtosend',64).
used('sendAdSMS','phoneNumber_Alice_3','userid',65).
used('sendAdSMS','ad','adsms',66).


wasControlledBy('sendData','DC','owner',81453,81454).
wasGeneratedBy('data_report','sendData','dataresponse',81454).

wasControlledBy('sendData','Alice','receiver',81455,81456).
used('sendData','data_report','requestresponsereceived',81456).

action('sendData','sendData').
action('sendThirdPartiesCookie','sendThirdPartiesCookie').
action('updateData','updateData').
action('sendAdSMS','sendAdSMS').
action('sendMail','sendMail').
action('sendImprovementCookie','sendImprovementCookie').
action('createAccount','createAccount').
action('consent','consent').
action('login','login').
action('buyItem','buyItem').
action('delete','delete').
action('askDataAccess','askDataAccess').
action('askRefund','askRefund').
action('sendTicket','sendTicket').
action('sendPersonalizationCookie','sendPersonalizationCookie').
action('sendAnalysisCookie','sendAnalysisCookie').
action('providePolicy','providePolicy').
action('askErase','askErase').
action('updateConsent','updateConsent').
action('refund','refund').
purposes(_,_,['consent','delete','askErase','sendData','askDataAccess','updateConsent','accessWebPage','updateData','createAccount','login']).
