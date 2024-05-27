wasControlledBy('createAccount','David','owner',1,2).
wasGeneratedBy('id_David_1', 'createAccount', 'personal data', 2 ).

wasControlledBy('consent','David', 'owner', 8, 9).
wasGeneratedBy('consent_David_1', 'consent', 'consent', 9).

purposes('consent_David_1','id_David_1',['sendImprovementCookie','sendThirdPartiesCookie']).

wasControlledBy('updateConsent','David', 'owner', 29, 31).
used('updateConsent', 'consent_David_1', 'updateConsent', 30).
wasGeneratedBy('consent_David_2', 'update', 'consent', 31).


purposes('consent_David_2','id_David_1',['sendAnalysisCookie','sendImprovementCookie']).


wasControlledBy('sendAnalysisCookie','DC', 'owner', 34, 37).
wasGeneratedBy('analysis_cookie', 'sendAnalysisCookie', 'cookie to send', 35).
used('sendAnalysisCookie','id_David_1', 'user id', 36).
used('sendAnalysisCookie','analysis_cookie', 'cookie', 37).


action('sendThirdPartiesCookie', 'sendThirdPartiesCookie').
action('sendImprovementCookie', 'sendImprovementCookie').
action('createAccount', 'createAccount').
action('consent', 'consent').
action('sendPersonalizationCookie', 'sendPersonalizationCookie').
action('sendAnalysisCookie', 'sendAnalysisCookie').
action('providePolicy', 'providePolicy').
action('updateConsent', 'updateConsent').
purposes(_,_,['consent','delete','askErase','sendData','askDataAccess','updateConsent','accessWebPage','updateData','createAccount','login']).
