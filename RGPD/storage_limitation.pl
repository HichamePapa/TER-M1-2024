writeStorageLimitationNotCompliant(D,TU):- write('storage limitation not compliant : data '), write(D), write(' was last used at '), write(TU), writeln(' and not deleted in time'), false.

storageLimitationOk(D,TU):-
	((TCURRENT-TU)<TLIMITSTORAGE, !);
	(notAvailable(D,T),((T-TU)<TLIMITSTORAGE), !).

storageLimitation(D):-
	(used(P,D,_R,TU),\+ (action(P,'delete')),
		(storageLimitationOk(D,TU);
		(\+ storageLimitationOk(D,TU), writeStorageLimitationNotCompliant(D,TU)))).