%	consent
isPurpose(PU,D,C):- purposes(C,D,Q), nth0(_X,Q,PU).

consent(C,D,PU,T):- wasControlledBy(P1,_S,'owner',_TB,_TE), wasGeneratedBy(C,P1,'consent',T), isPurpose(PU,D,C).
revoke(C,T):- used(_P,C,'revokeConsent',T).
nextConsent(C,C1,T):- wasControlledBy(P1,_S,'owner',_TB,_TE), used(P1,C,'updateConsent',_TU), wasGeneratedBy(C1,P1,'consent',T).
lastConsent(C):- consent(C,_D,_P1,_T),\+ (nextConsent(C,_C1,_TU)).
isPersonal(D):- personal(_S,Q), nth0(_X,Q,D).

%	lawfulness
writeConsentNotFound(P,D,PU,T):- write('consent not compliant : process '), write(P), write(' used '), write(D), write(' for purpose '), write(PU), write(' at time '), write(T), writeln(' without consent'), false.
writeNoDataUsed():- writeln('LAWFULNESS OK - lawful system as there is no use of any data').

consentFoundOk(D,PU,T):-
	(consent(C,D,PU,TG),TG<T,
		((lastConsent(C),
			((\+ revoke(C,_TU), !);
			(revoke(C,TU),(TU>T), !)));
		(nextConsent(C,_C1,TG1),(TG1>T), !)
		)
	).

legal(P,D,_C,_TG,T):-
	(used(P,D,_R,T),action(P,PU),isPersonal(D),
		(consentFoundOk(D,PU,T);
		(\+ consentFoundOk(D,PU,T), writeConsentNotFound(P,D,PU,T)))
	);
	((\+ (used(P,D,_R,T),action(P,_PU))),writeNoDataUsed()).