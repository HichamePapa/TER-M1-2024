writeStorageLimitationNotCompliant(D,TG):- write('STORAGE LIMITATION ISSUE - data '), write(D), write(' was generated at '), write(TG), writeln(', never used and not deleted in time'), false.

storageLimitationOk(D,TG):-
	(tCurrent(TCURRENT),tLimit('storage',TLIMITSTORAGE),(TCURRENT-TG)<TLIMITSTORAGE, !).

storageLimitation(D):-
	(wasGeneratedBy(_P,D,_R,TG),isPersonalP(D,DP),
		(storageLimitationOk(DP,TG);
		(\+ storageLimitationOk(DP,TG), writeStorageLimitationNotCompliant(DP,TG)))).