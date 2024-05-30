wasControlledBy('createAccount','Alice','owner',1,8).
wasGeneratedBy('birthday_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('wall_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('friends_Alice_1', 'createAccount', 'personal data', 7 ).
wasGeneratedBy('username_Alice_1', 'createAccount', 'personal data', 8 ).


wasControlledBy('consent','Alice','owner', 9, 10).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 10).

purposes('consent_Alice_1','birthday_Alice_1',[]).
purposes(_,'mail_Alice_1',['sendMail','sendTicket']).
purposes(_,'name_Alice_1',[]).
purposes('consent_Alice_1','id_Alice_1',['sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Alice_1','wall_Alice_1',['post','showRecommendation']).
purposes('consent_Alice_1','friends_Alice_1',['post']).
purposes(_,'username_Alice_1',['post']).



wasControlledBy('updateConsent','Alice', 'owner', 11, 13).
used('updateConsent', 'consent_Alice_1', 'consent', 12).
wasGeneratedBy('consent_Alice_2', 'updateConsent', 'consent', 13).


purposes('consent_Alice_2','birthday_Alice_1',['showRecommendation']).
purposes('consent_Alice_2','id_Alice_1',['sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Alice_2','wall_Alice_1',['post']).
purposes('consent_Alice_2','friends_Alice_1',['post','showRecommendation']).





wasControlledBy('updateData','Alice', 'owner', 14, 16).
used('updateData','birthday_Alice_1', 'data to update', 15).
wasGeneratedBy('birthday_Alice_2', 'updateData', 'updated data', 16).

wasControlledBy('post','Alice', 'owner', 17, 24).
wasGeneratedBy('message', 'post', 'new post message', 18).
used('post','username_Alice_1', 'username', 19).
used('post','friends_Alice_1', 'user friends', 20).
used('post','wall_Alice_1', 'user wall', 21).
used('post', 'name_Alice_1', 'extra data', 22).

used('post','message', 'user message', 23).


wasGeneratedBy('newPost', 'post', 'new user post', 24).

wasControlledBy('sendTicket','Alice', 'owner', 25, 28).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 26).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 27).
used('sendTicket', 'ticket', 'ticket sent', 28).



wasControlledBy('sendTicket','DC', 'owner', 116251, 116254).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 116252).
used('sendTicket','mail_Alice_1', 'ticket reply sent', 116253).
used('sendTicket','ticketReply', 'ticket reply sent', 116254).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 77908, 77912).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 77909).
used('sendAnalysisCookie','id_Alice_1', 'user id', 77910).
used('sendAnalysisCookie', 'id_Alice_1', 'extra data', 77911).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 77912).


wasControlledBy('sendTicket','Alice', 'owner', 77913, 77914).
used('sendTicket', 'ticketReply', 'ticket reply received', 77914).
wasControlledBy('askDataAccess','Alice','owner', 29, 34).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 30, 33).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 31).
used('sendAnalysisCookie','id_Alice_1', 'user id', 32).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 33).

wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 34).

used('revokeConsent','consent_Alice_2','revokeConsent', 35).

wasControlledBy('sendData','DC', 'owner', 124517, 124519).
used('sendData', 'data_request_Alice', 'request received', 124518).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 124519).

wasControlledBy('sendData','Alice', 'receiver', 124520, 124521).
used('sendData', 'data_report_Alice', 'request response received', 124521).
wasControlledBy('createAccount','Bob','owner',1,8).
wasGeneratedBy('birthday_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('wall_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('friends_Bob_1', 'createAccount', 'personal data', 7 ).
wasGeneratedBy('username_Bob_1', 'createAccount', 'personal data', 8 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 9, 13).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 10).
used('sendAnalysisCookie','id_Bob_1', 'user id', 11).
used('sendAnalysisCookie', 'username_Bob_1', 'extra data', 12).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 13).


wasControlledBy('askDataAccess','Bob','owner', 14, 19).
wasControlledBy('sendImprovementCookie','DC', 'owner', 15, 18).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 16).
used('sendImprovementCookie','id_Bob_1', 'user id', 17).

used('sendImprovementCookie','improvement_cookie', 'cookie', 18).


wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 19).

wasControlledBy('sendData','DC', 'owner', 51078, 51080).
used('sendData', 'data_request_Bob', 'request received', 51079).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 51080).

wasControlledBy('sendData','Bob', 'receiver', 51081, 51082).
used('sendData', 'data_report_Bob', 'request response received', 51082).



wasControlledBy('updateData','Bob', 'owner', 20, 22).
used('updateData','id_Bob_1', 'data to update', 21).
wasGeneratedBy('id_Bob_2', 'updateData', 'updated data', 22).

wasControlledBy('joinGroup','Bob','owner',23,24).
used('joinGroup','id_Bob_2', 'join group', 24).

wasControlledBy('consent','Bob','owner', 25, 26).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 26).

purposes('consent_Bob_1','birthday_Bob_1',['showRecommendation']).
purposes(_,'mail_Bob_1',['sendMail','sendTicket']).
purposes(_,'name_Bob_1',[]).
purposes('consent_Bob_1','id_Bob_2',['sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Bob_1','wall_Bob_1',['post']).
purposes('consent_Bob_1','friends_Bob_1',['post','showRecommendation']).
purposes(_,'username_Bob_1',['post']).


used('revokeConsent','consent_Bob_1','revokeConsent', 27).
wasControlledBy('joinGroup','Bob','owner',28,29).
used('joinGroup','id_Bob_2', 'join group', 29).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 30, 34).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 31).
used('sendAnalysisCookie','id_Bob_2', 'user id', 32).
used('sendAnalysisCookie', 'username_Bob_1', 'extra data', 33).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 34).

wasControlledBy('updateConsent','Bob', 'owner', 35, 37).
used('updateConsent', 'consent_Bob_1', 'consent', 36).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 37).


purposes('consent_Bob_2','birthday_Bob_1',['showRecommendation']).
purposes('consent_Bob_2','id_Bob_2',['sendThirdPartiesCookie','sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Bob_2','wall_Bob_1',['post']).
purposes('consent_Bob_2','friends_Bob_1',['post','showRecommendation']).


wasControlledBy('post','Bob', 'owner', 38, 49).
wasGeneratedBy('message', 'post', 'new post message', 39).
used('post','username_Bob_1', 'username', 40).
used('post','friends_Bob_1', 'user friends', 41).
used('post','wall_Bob_1', 'user wall', 42).
used('post', 'birthday_Bob_1', 'extra data', 43).

used('post','message', 'user message', 44).

wasControlledBy('sendImprovementCookie','DC', 'owner', 45, 48).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 46).
used('sendImprovementCookie','id_Bob_2', 'user id', 47).

used('sendImprovementCookie','improvement_cookie', 'cookie', 48).

wasGeneratedBy('newPost', 'post', 'new user post', 49).

wasControlledBy('sendTicket','Bob', 'owner', 50, 54).
used('sendTicket', 'username_Bob_1', 'extra data', 51).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 52).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 53).
used('sendTicket', 'ticket', 'ticket sent', 54).



action('sendData', 'sendData').
action('sendThirdPartiesCookie', 'sendThirdPartiesCookie').
action('updateData', 'updateData').
action('sendAdSMS', 'sendAdSMS').
action('sendMail', 'sendMail').
action('sendImprovementCookie', 'sendImprovementCookie').
action('showRecommendation', 'showRecommendation').
action('createAccount', 'createAccount').
action('consent', 'consent').
action('login', 'login').
action('joinGroup', 'joinGroup').
action('delete', 'delete').
action('askDataAccess', 'askDataAccess').
action('sendTicket', 'sendTicket').
action('sendPersonalizationCookie', 'sendPersonalizationCookie').
action('sendAnalysisCookie', 'sendAnalysisCookie').
action('providePolicy', 'providePolicy').
action('post', 'post').
action('askErase', 'askErase').
action('updateConsent', 'updateConsent').
purposes(_,_,['consent','delete','askErase','sendData','askDataAccess','updateConsent','accessWebPage','updateData','createAccount','login']).
