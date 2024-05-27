%	right access compliance
writeRightAccessNotCompliant(S,TE):- write('right access not compliant : subject '), write(S), write(' asked for access at time '), write(TE), writeln(' and was not sent data in time'), false.
writeNoAccessAsked():- writeln('system compliant on right access as no asked was asked').

accessTimeLimitNotOver(_P,T):- (tCurrent(TCURRENT),tLimit('access',TLIMITACCESS),(TCURRENT-T)<TLIMITACCESS).

rightAccessOk(P,A,TE):-
	(accessTimeLimitNotOver(P,TE), !);
	(wasControlledBy(P2,_S2,'owner',_TB2,TE2),used(P2,A,_R,_T),action(P2,'sendData'),(tLimit('access',TLIMITACCESS),(TE2-TE)<TLIMITACCESS), !).

rightAccess(S):-
    wasControlledBy(P,S,'owner',_TB,TE), wasGeneratedBy(A,P,_R,_T), action(P,'askDataAccess'),
    (rightAccessOk(P,A,TE);
    		(\+ rightAccessOk(P,A,TE), writeRightAccessNotCompliant(S,TE)));
    	(\+ (wasControlledBy(P,S,'owner',_TB,_TE),action(P,'askDataAccess')), writeNoAccessAsked()).
