% === CAUSAL DEPENDENCIES ===

wasTriggeredBy(P1,P2,TU) :- used(P1,D,_R1,TU) , wasGeneratedBy(D,P2,_R2,_TG).
wasDerivedFrom(D1,D2,R1,TG) :- wasGeneratedBy(D1,P,_R,TG) , used(P,D2,R1,_TU).

% 	Multi-step casual dependencies in Open Provenance
usedP(P1,D1) :- wasTriggeredByP(P1,P) , used(P,D1,_R,_TU).
wasGeneratedByP(D1,P1) :- wasGeneratedBy(D1,P,_R,_TG) , wasTriggeredByP(P,P1).
wasTriggeredByP(P1,P2) :- wasTriggeredBy(P1,P2,_TU).
wasTriggeredByP(P1,P2) :- wasTriggeredBy(P1,P,_TU) , wasTriggeredByP(P,P2).
wasDerivedFromP(D1,D2) :- wasDerivedFrom(D1,D2,_R,_TG).
wasDerivedFromP(_D1,D2) :- wasDerivedFrom(D2,D,_R,_TG) , wasDerivedFromP(D,D2).

%	Additional casual dependencies from Data Fusion and new ones
owns(S1,D1) :- wasGeneratedBy(D1,P,_R,_TG) , wasControlledBy(P,S1,'owner',_TB,_TE).
contributedTo(S1,D1,R) :- wasGeneratedByP(D1,P) , wasControlledBy(P,S1,R,_TB,_TE).
notAvailable(D1,TU) :- used(P,D1,_R,TU) , action(P,'delete'). %meaning the action of P is 'delete'

%	Personal data verification
isPersonal(D):- wasGeneratedBy(D,_P,'personal data',_T).
isPersonalP(D):-
    (isPersonal(D), !);
    (isPersonal(D1), wasDerivedFromP(D,D1), !).
