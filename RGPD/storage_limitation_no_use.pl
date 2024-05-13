writeStorageLimitationNotCompliant(D,TG):- write('storage limitation not compliant : data '), write(D), write(' was generated at '), write(TG), writeln(', never used and not deleted in time'), false.

storageLimitationOk(D,TG):-
	(tCurrent(TCURRENT),tLimit('storage',TLIMITSTORAGE),(TCURRENT-TG)<TLIMITSTORAGE, !).

storageLimitation(D):-
	(wasGeneratedBy(_P,D,_R,TG),isPersonalP(D),
		(storageLimitationOk(D,TG);
		(\+ storageLimitationOk(D,TG), writeStorageLimitationNotCompliant(D,TG)))).