wasControlledBy('createAccount','Alice','owner',1,8).
wasGeneratedBy('birthday_Alice_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('mail_Alice_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('name_Alice_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('id_Alice_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('wall_Alice_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('friends_Alice_1', 'createAccount', 'personal data', 7 ).
wasGeneratedBy('username_Alice_1', 'createAccount', 'personal data', 8 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 9, 12).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 10).
used('sendAnalysisCookie','id_Alice_1', 'user id', 11).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 12).

wasControlledBy('consent','Alice','owner', 13, 18).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 14, 17).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 15).
used('sendAnalysisCookie','id_Alice_1', 'user id', 16).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 17).

wasGeneratedBy('consent_Alice_1','consent', 'consent', 18).

purposes('consent_Alice_1','birthday_Alice_1',[]).
purposes(_,'mail_Alice_1',['sendMail','sendTicket']).
purposes(_,'name_Alice_1',[]).
purposes('consent_Alice_1','id_Alice_1',['sendThirdPartiesCookie','joinGroup']).
purposes('consent_Alice_1','wall_Alice_1',['post','showRecommendation']).
purposes('consent_Alice_1','friends_Alice_1',['post','showRecommendation']).
purposes(_,'username_Alice_1',['post']).



used('revokeConsent','consent_Alice_1','revokeConsent', 19).



wasControlledBy('updateData','Alice', 'owner', 20, 22).
used('updateData','username_Alice_1', 'data to update', 21).
wasGeneratedBy('username_Alice_2', 'updateData', 'updated data', 22).

wasControlledBy('post','Alice', 'owner', 23, 35).
wasGeneratedBy('message', 'post', 'new post message', 24).
used('post','username_Alice_2', 'username', 25).
used('post','friends_Alice_1', 'user friends', 26).
used('post','wall_Alice_1', 'user wall', 27).
used('post', 'mail_Alice_1', 'extra data', 28).

used('post','message', 'user message', 29).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 30, 34).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 31).
used('sendAnalysisCookie','id_Alice_1', 'user id', 32).
used('sendAnalysisCookie', 'id_Alice_1', 'extra data', 33).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 34).


wasGeneratedBy('newPost', 'post', 'new user post', 35).
wasControlledBy('askDataAccess','Alice','owner', 36, 42).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 37, 41).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 38).
used('sendAnalysisCookie','id_Alice_1', 'user id', 39).
used('sendAnalysisCookie', 'friends_Alice_1', 'extra data', 40).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 41).

wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 42).

wasControlledBy('sendData','DC', 'owner', 50751, 50753).
used('sendData', 'data_request_Alice', 'request received', 50752).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 50753).

wasControlledBy('sendData','Alice', 'receiver', 50754, 50755).
used('sendData', 'data_report_Alice', 'request response received', 50755).
wasControlledBy('sendMail','DC', 'owner', 43, 50).
wasGeneratedBy('message','sendMail', 'mail to send', 44).
used('sendMail','mail_Alice_1', 'address to send to', 45).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 46, 49).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 47).
used('sendAnalysisCookie','id_Alice_1', 'user id', 48).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 49).

used('sendMail', 'message', 'mail sent', 50).
wasControlledBy('post','Alice', 'owner', 51, 66).
wasGeneratedBy('message', 'post', 'new post message', 52).
used('post','username_Alice_2', 'username', 53).
used('post','friends_Alice_1', 'user friends', 54).
used('post','wall_Alice_1', 'user wall', 55).

used('post','message', 'user message', 56).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 57, 60).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 58).
used('sendAnalysisCookie','id_Alice_1', 'user id', 59).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 60).

wasControlledBy('sendImprovementCookie','DC', 'owner', 61, 65).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 62).
used('sendImprovementCookie','id_Alice_1', 'user id', 63).
used('sendImprovementCookie', 'friends_Alice_1', 'extra data', 64).

used('sendImprovementCookie','improvement_cookie', 'cookie', 65).

wasGeneratedBy('newPost', 'post', 'new user post', 66).
wasControlledBy('sendTicket','Alice', 'owner', 67, 71).
used('sendTicket', 'id_Alice_1', 'extra data', 68).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 69).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 70).
used('sendTicket', 'ticket', 'ticket sent', 71).


wasControlledBy('createAccount','Bob','owner',1,8).
wasGeneratedBy('birthday_Bob_1', 'createAccount', 'personal data', 2 ).
wasGeneratedBy('mail_Bob_1', 'createAccount', 'personal data', 3 ).
wasGeneratedBy('name_Bob_1', 'createAccount', 'personal data', 4 ).
wasGeneratedBy('id_Bob_1', 'createAccount', 'personal data', 5 ).
wasGeneratedBy('wall_Bob_1', 'createAccount', 'personal data', 6 ).
wasGeneratedBy('friends_Bob_1', 'createAccount', 'personal data', 7 ).
wasGeneratedBy('username_Bob_1', 'createAccount', 'personal data', 8 ).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 9, 12).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 10).
used('sendAnalysisCookie','id_Bob_1', 'user id', 11).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 12).


wasControlledBy('consent','Bob','owner', 13, 14).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 14).

purposes('consent_Bob_1','birthday_Bob_1',[]).
purposes(_,'mail_Bob_1',['sendMail','sendTicket']).
purposes(_,'name_Bob_1',[]).
purposes('consent_Bob_1','id_Bob_1',['sendThirdPartiesCookie','joinGroup']).
purposes('consent_Bob_1','wall_Bob_1',['post','showRecommendation']).
purposes('consent_Bob_1','friends_Bob_1',['post','showRecommendation']).
purposes(_,'username_Bob_1',['post']).

wasControlledBy('sendTicket','Bob', 'owner', 15, 19).
used('sendTicket', 'birthday_Bob_1', 'extra data', 16).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 17).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 18).
used('sendTicket', 'ticket', 'ticket sent', 19).


wasControlledBy('sendMail','DC', 'owner', 20, 28).
wasGeneratedBy('message','sendMail', 'mail to send', 21).
used('sendMail','mail_Bob_1', 'address to send to', 22).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 23, 27).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 24).
used('sendAnalysisCookie','id_Bob_1', 'user id', 25).
used('sendAnalysisCookie', 'username_Bob_1', 'extra data', 26).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 27).

used('sendMail', 'message', 'mail sent', 28).
wasControlledBy('askDataAccess','Bob','owner', 29, 34).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 30, 33).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 31).
used('sendAnalysisCookie','id_Bob_1', 'user id', 32).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 33).

wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 34).

wasControlledBy('sendData','DC', 'owner', 97974, 97976).
used('sendData', 'data_request_Bob', 'request received', 97975).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 97976).

wasControlledBy('sendData','Bob', 'receiver', 97977, 97978).
used('sendData', 'data_report_Bob', 'request response received', 97978).

wasControlledBy('sendTicket','DC', 'owner', 72888, 72891).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 72889).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 72890).
used('sendTicket','ticketReply', 'ticket reply sent', 72891).

wasControlledBy('sendImprovementCookie','DC', 'owner', 114132, 114136).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 114133).
used('sendImprovementCookie','id_Bob_1', 'user id', 114134).
used('sendImprovementCookie', 'birthday_Bob_1', 'extra data', 114135).

used('sendImprovementCookie','improvement_cookie', 'cookie', 114136).

wasControlledBy('sendTicket','Bob', 'owner', 114137, 114138).
used('sendTicket', 'ticketReply', 'ticket reply received', 114138).
wasControlledBy('askErase','Bob', 'owner', 35, 42).
used('askErase','birthday_Bob_1', 'to erase data', 36).
used('askErase','mail_Bob_1', 'to erase data', 37).
used('askErase','name_Bob_1', 'to erase data', 38).
used('askErase','id_Bob_1', 'to erase data', 39).
used('askErase','wall_Bob_1', 'to erase data', 40).
used('askErase','friends_Bob_1', 'to erase data', 41).
used('askErase','username_Bob_1', 'to erase data', 42).



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
