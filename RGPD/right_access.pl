%	right access compliance
writeRightAccessNotCompliant(S,TE):- write('right access not compliant : subject '), write(S), write(' asked for access at time '), write(TE), writeln(' and was not sent data in time'), false.
writeNoAccessAsked():- writeln('system compliant on right access as no asked was asked').

accessTimeLimitNotOver(_P,T):- ((TCURRENT-T)<TLIMITACCESS).
rightAccessOk(P,TE):-
	(accessTimeLimitNotOver(P,TE), !);
	(wasControlledBy(P2,_S2,'owner',_TB2,TE2),action(P2,'sendData'),((TE2-TE)<TLIMITACCESS), !).

rightAccess(S):-
	wasControlledBy(P,S,'owner',_TB,TE),action(P,'askDataAccess'),
		(rightAccessOk(P,TE);
		(\+ rightAccessOk(P,TE), writeRightAccessNotCompliant(S,TE)));
	(\+ (wasControlledBy(P,S,'owner',_TB,_TE),action(P,'askDataAccess')), writeNoAccessAsked()).