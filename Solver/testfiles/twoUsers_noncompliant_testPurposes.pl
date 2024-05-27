%%Attendu: Erreur sur Alice, utilisation de cookies thirdParties sans consentement.

wasControlledBy('create_account','Bob','owner',10,15).
wasControlledBy('consent','Bob','owner',16,20).
wasControlledBy('joinGroup','Bob','owner',20,21).
wasControlledBy('update','Bob','owner',29,30).
wasGeneratedBy('wall_bob','create_account','personal data',15).
wasGeneratedBy('friend_list_bob','create_account','personal data',15).
wasGeneratedBy('phone_bob','create_account','personal data',15).
wasGeneratedBy('id_bob','create_account','personal data',15).
wasGeneratedBy('email_bob','create_account','personal data',15).
wasGeneratedBy('privacy_policy_template','create_account','policy',15).
wasGeneratedBy('consent_bob_v0','consent','consent',17).
wasGeneratedBy('marketing_cookie','createCookie','cookie',21).
wasGeneratedBy('consent_bob_v1','update','consent',29).
wasTriggeredBy('consent','create_account','policy_used',15).
wasTriggeredBy('createCookie','joinGroup','information',21).
used('consent','privacy_policy_template','template',16).
used('sendCookie','marketing_cookie','cookie',26).
used('update','consent_bob_v0','consent',29).
used('askErase','phone_bob','to erase data',44800).
used('sendData','data_request','request',44701).
used('createCookie','id_bob','id',21).

wasControlledBy('create_account','Alice','owner',10,15).
wasControlledBy('joinGroup','Alice','owner',20,21).
wasGeneratedBy('wall_Alice','create_account','personal data',15).
wasGeneratedBy('friend_list_Alice','create_account','personal data',15).
wasGeneratedBy('phone_Alice','create_account','personal data',15).
wasGeneratedBy('id_Alice','create_account','personal data',15).
wasGeneratedBy('email_Alice','create_account','personal data',15).
wasGeneratedBy('privacy_policy_template','create_account','policy',15).
wasGeneratedBy('marketing_cookie','createCookie','cookie',21).
wasTriggeredBy('createCookie','joinGroup','information',21).
used('sendCookie','marketing_cookie','cookie',26).
used('askErase','phone_Alice','to erase data',44800).
used('sendData','data_request','request',44701).
used('createCookie','id_Alice','id',21).

%%actions of processes
action('consent','consent').
action('update','updateConsent').
action('sendCookie','thirdParties').
action('create_account','createAccount').
action('joinGroup','joinGroup').
action('askErase','askErase').
action('askDataAccess','askDataAccess').
action('sendData','sendData').
action('createCookie','createCookie').

%%purposes

purposes(_,_,['consent','delete','sendData','askErase','askDataAccess','createCookie']).
purposes('consent_bob_v0',_,['thirdParties','analysis','improvement']).
purposes('consent_bob_v1',_,['analysis','improvement']).
