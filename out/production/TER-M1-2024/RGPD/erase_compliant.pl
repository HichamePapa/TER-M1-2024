%	data erasure compliance
writeNoEraseAsked():- writeln('system compliant for data erasure as no erase was asked').
writeEraseNotCompliant(D,T):- write('erase not compliant : erase of data '), write(D), write(' was asked at '), write(T), writeln(' but not done in time'), false.

askErase(D,T):- used(P,D,_R,T),action(P,'askErase').
eraseComplete(D):- askErase(D,T),used(P,D,_R,TU),action(P,'delete'),(tLimit('erase',TLIMITERASE),(T-TU)<TLIMITERASE).
eraseNotDoneYet(D):- askErase(D,T),\+ (used(P,D,_R,_TU),action(P,'delete')),(tCurrent(TCURRENT),tLimit('erase',TLIMITERASE),(TCURRENT-T)<TLIMITERASE).

dataErasureOk(D):-
	(eraseComplete(D),!);
	(eraseNotDoneYet(D),!).

eraseCompliant(D):-
	(askErase(D,T),
		(dataErasureOk(D);
		(\+ dataErasureOk(D),writeEraseNotCompliant(D,T))));
	(\+ askErase(D,_T), writeNoEraseAsked()).