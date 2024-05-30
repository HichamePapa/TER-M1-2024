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
purposes('consent_Alice_1','id_Alice_1',['sendThirdPartiesCookie','sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Alice_1','wall_Alice_1',['post']).
purposes('consent_Alice_1','friends_Alice_1',['post']).
purposes(_,'username_Alice_1',['post']).


wasControlledBy('sendMail','DC', 'owner', 11, 14).
wasGeneratedBy('message','sendMail', 'mail to send', 12).
used('sendMail','mail_Alice_1', 'address to send to', 13).

used('sendMail', 'message', 'mail sent', 14).
wasControlledBy('sendTicket','Alice', 'owner', 15, 19).
used('sendTicket', 'username_Alice_1', 'extra data', 16).

used('sendTicket','mail_Alice_1', 'ticket sender mail', 17).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 18).
used('sendTicket', 'ticket', 'ticket sent', 19).



wasControlledBy('sendTicket','DC', 'owner', 45975, 45978).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 45976).
used('sendTicket','mail_Alice_1', 'ticket reply sent', 45977).
used('sendTicket','ticketReply', 'ticket reply sent', 45978).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 87746, 87749).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 87747).
used('sendAnalysisCookie','id_Alice_1', 'user id', 87748).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 87749).


wasControlledBy('sendTicket','Alice', 'owner', 87750, 87751).
used('sendTicket', 'ticketReply', 'ticket reply received', 87751).
wasControlledBy('askDataAccess','Alice','owner', 20, 25).
wasControlledBy('sendImprovementCookie','DC', 'owner', 21, 24).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 22).
used('sendImprovementCookie','id_Alice_1', 'user id', 23).

used('sendImprovementCookie','improvement_cookie', 'cookie', 24).


wasGeneratedBy('data_request_Alice', 'askDataAccess', 'request', 25).

wasControlledBy('sendData','DC', 'owner', 103894, 103896).
used('sendData', 'data_request_Alice', 'request received', 103895).
wasGeneratedBy('data_report_Alice','sendData', 'data response', 103896).

wasControlledBy('sendData','Alice', 'receiver', 103897, 103898).
used('sendData', 'data_report_Alice', 'request response received', 103898).



wasControlledBy('updateData','Alice', 'owner', 26, 28).
used('updateData','mail_Alice_1', 'data to update', 27).
wasGeneratedBy('mail_Alice_2', 'updateData', 'updated data', 28).

wasControlledBy('showRecommendation','DC', 'owner', 29, 42).
used('showRecommendation','id_Alice_1', 'user id', 30).
used('showRecommendation','birthday_Alice_1', 'user birth day', 31).
used('showRecommendation','friends_Alice_1', 'user friends', 32).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 33, 37).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 34).
used('sendAnalysisCookie','id_Alice_1', 'user id', 35).
used('sendAnalysisCookie', 'id_Alice_1', 'extra data', 36).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 37).

wasControlledBy('sendPersonalizationCookie','DC', 'owner', 38, 41).
wasGeneratedBy('personalization_cookie', 'sendPersonalizationCookie', 'cookie to send', 39).
used('sendPersonalizationCookie','id_Alice_1', 'user id', 40).

used('sendPersonalizationCookie','personalization_cookie', 'cookie', 41).

used('showRecommendation','wall_Alice_1', 'user wall', 42).
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
used('sendAnalysisCookie', 'name_Bob_1', 'extra data', 12).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 13).


wasControlledBy('sendTicket','Bob', 'owner', 14, 18).
used('sendTicket', 'wall_Bob_1', 'extra data', 15).

used('sendTicket','mail_Bob_1', 'ticket sender mail', 16).
wasGeneratedBy('ticket', 'sendTicket', 'ticket to send', 17).
used('sendTicket', 'ticket', 'ticket sent', 18).



wasControlledBy('sendTicket','DC', 'owner', 125007, 125010).
wasGeneratedBy('ticketReply','sendTicket', 'ticket reply', 125008).
used('sendTicket','mail_Bob_1', 'ticket reply sent', 125009).
used('sendTicket','ticketReply', 'ticket reply sent', 125010).


wasControlledBy('sendTicket','Bob', 'owner', 125011, 125012).
used('sendTicket', 'ticketReply', 'ticket reply received', 125012).
wasControlledBy('sendMail','DC', 'owner', 19, 27).
wasGeneratedBy('message','sendMail', 'mail to send', 20).
used('sendMail','mail_Bob_1', 'address to send to', 21).
wasControlledBy('sendAnalysisCookie','DC', 'owner', 22, 26).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 23).
used('sendAnalysisCookie','id_Bob_1', 'user id', 24).
used('sendAnalysisCookie', 'friends_Bob_1', 'extra data', 25).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 26).

used('sendMail', 'message', 'mail sent', 27).



wasControlledBy('updateData','Bob', 'owner', 28, 30).
used('updateData','mail_Bob_1', 'data to update', 29).
wasGeneratedBy('mail_Bob_2', 'updateData', 'updated data', 30).

wasControlledBy('consent','Bob','owner', 31, 32).

wasGeneratedBy('consent_Bob_1','consent', 'consent', 32).

purposes('consent_Bob_1','birthday_Bob_1',[]).
purposes(_,'mail_Bob_2',['sendMail','sendTicket']).
purposes(_,'name_Bob_1',[]).
purposes('consent_Bob_1','id_Bob_1',['sendThirdPartiesCookie','sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Bob_1','wall_Bob_1',['post']).
purposes('consent_Bob_1','friends_Bob_1',['post']).
purposes(_,'username_Bob_1',['post']).


wasControlledBy('updateConsent','Bob', 'owner', 33, 35).
used('updateConsent', 'consent_Bob_1', 'consent', 34).
wasGeneratedBy('consent_Bob_2', 'updateConsent', 'consent', 35).


purposes('consent_Bob_2','birthday_Bob_1',[]).
purposes('consent_Bob_2','id_Bob_1',['sendAnalysisCookie','sendThirdPartiesCookie','sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Bob_2','wall_Bob_1',['post']).
purposes('consent_Bob_2','friends_Bob_1',['post','showRecommendation']).


wasControlledBy('showRecommendation','DC', 'owner', 36, 40).
used('showRecommendation','id_Bob_1', 'user id', 37).
used('showRecommendation','birthday_Bob_1', 'user birth day', 38).
used('showRecommendation','friends_Bob_1', 'user friends', 39).


used('showRecommendation','wall_Bob_1', 'user wall', 40).

wasControlledBy('askDataAccess','Bob','owner', 41, 47).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 42, 46).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 43).
used('sendAnalysisCookie','id_Bob_1', 'user id', 44).
used('sendAnalysisCookie', 'mail_Bob_2', 'extra data', 45).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 46).

wasGeneratedBy('data_request_Bob', 'askDataAccess', 'request', 47).

wasControlledBy('sendData','DC', 'owner', 60823, 60825).
used('sendData', 'data_request_Bob', 'request received', 60824).
wasGeneratedBy('data_report_Bob','sendData', 'data response', 60825).

wasControlledBy('sendData','Bob', 'receiver', 60826, 60827).
used('sendData', 'data_report_Bob', 'request response received', 60827).
wasControlledBy('joinGroup','Bob','owner',48,49).
used('joinGroup','id_Bob_1', 'join group', 49).
wasControlledBy('sendThirdPartiesCookie','DC', 'owner', 50, 53).
wasGeneratedBy('marketing_cookie', 'sendThirdPartiesCookie', 'cookie to send', 51).
used('sendThirdPartiesCookie','id_Bob_1', 'user id', 52).

used('sendThirdPartiesCookie','marketing_cookie', 'cookie', 53).

wasControlledBy('sendAnalysisCookie','DC', 'owner', 54, 58).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 55).
used('sendAnalysisCookie','id_Bob_1', 'user id', 56).
used('sendAnalysisCookie', 'friends_Bob_1', 'extra data', 57).

used('sendAnalysisCookie','analysis_cookie', 'cookie', 58).

wasControlledBy('updateConsent','Bob', 'owner', 59, 61).
used('updateConsent', 'consent_Bob_2', 'consent', 60).
wasGeneratedBy('consent_Bob_3', 'updateConsent', 'consent', 61).


purposes('consent_Bob_3','birthday_Bob_1',[]).
purposes('consent_Bob_3','id_Bob_1',['sendThirdPartiesCookie','sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Bob_3','wall_Bob_1',['post']).
purposes('consent_Bob_3','friends_Bob_1',['post']).





wasControlledBy('updateData','Bob', 'owner', 62, 64).
used('updateData','wall_Bob_1', 'data to update', 63).
wasGeneratedBy('wall_Bob_2', 'updateData', 'updated data', 64).


wasControlledBy('updateConsent','Bob', 'owner', 65, 67).
used('updateConsent', 'consent_Bob_3', 'consent', 66).
wasGeneratedBy('consent_Bob_4', 'updateConsent', 'consent', 67).


purposes('consent_Bob_4','birthday_Bob_1',[]).
purposes('consent_Bob_4','id_Bob_1',['sendThirdPartiesCookie','sendImprovementCookie','joinGroup','sendPersonalizationCookie']).
purposes('consent_Bob_4','wall_Bob_2',['post']).
purposes('consent_Bob_4','friends_Bob_1',['post','showRecommendation']).


wasControlledBy('post','Bob', 'owner', 68, 78).
wasGeneratedBy('message', 'post', 'new post message', 69).
used('post','username_Bob_1', 'username', 70).
used('post','friends_Bob_1', 'user friends', 71).
used('post','wall_Bob_2', 'user wall', 72).

used('post','message', 'user message', 73).

wasControlledBy('sendImprovementCookie','DC', 'owner', 74, 77).
wasGeneratedBy('improvement_cookie', 'sendImprovementCookie', 'cookie to send', 75).
used('sendImprovementCookie','id_Bob_1', 'user id', 76).

used('sendImprovementCookie','improvement_cookie', 'cookie', 77).

wasGeneratedBy('newPost', 'post', 'new user post', 78).



used('revokeConsent','consent_Bob_4','revokeConsent', 79).
wasControlledBy('askErase','Bob', 'owner', 80, 87).
used('askErase','birthday_Bob_1', 'to erase data', 81).
used('askErase','mail_Bob_2', 'to erase data', 82).
used('askErase','name_Bob_1', 'to erase data', 83).
used('askErase','id_Bob_1', 'to erase data', 84).
used('askErase','wall_Bob_2', 'to erase data', 85).
used('askErase','friends_Bob_1', 'to erase data', 86).
used('askErase','username_Bob_1', 'to erase data', 87).


wasControlledBy('delete','DC', 'owner', 125528, 125535).
used('delete','birthday_Bob_1', 'erase data', 125528).
used('delete','mail_Bob_2', 'erase data', 125529).
used('delete','name_Bob_1', 'erase data', 125530).
used('delete','id_Bob_1', 'erase data', 125531).
used('delete','wall_Bob_2', 'erase data', 125532).
used('delete','friends_Bob_1', 'erase data', 125533).
used('delete','username_Bob_1', 'erase data', 125534).

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
