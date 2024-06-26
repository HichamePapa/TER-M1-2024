writeStorageLimitationNotCompliant(D,TU):- write('storage limitation not compliant : data '), write(D), write(' was last used at '), write(TU), writeln(' and not deleted in time'), false.

storageLimitationOk(D,TU):-
	(tCurrent(TCURRENT),tLimit('storage',TLIMITSTORAGE),(TCURRENT-TU)<TLIMITSTORAGE, !);
	(notAvailable(D,T),(tLimit('storage',TLIMITSTORAGE),(T-TU)<TLIMITSTORAGE), !).

storageLimitation(D):-
	(used(P,D,_R,TU),isPersonalP(D,DP),\+ (action(P,'delete')),
		(storageLimitationOk(DP,TU);
		(\+ storageLimitationOk(DP,TU), writeStorageLimitationNotCompliant(DP,TU)))).