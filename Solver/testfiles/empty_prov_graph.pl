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